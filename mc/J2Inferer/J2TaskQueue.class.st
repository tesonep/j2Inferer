"
This objects represents a priority run queue. 
"
Class {
	#name : #J2TaskQueue,
	#superclass : #Object,
	#instVars : [
		'queue',
		'notifier',
		'runStart',
		'runTasks',
		'inQueue'
	],
	#category : 'J2Inferer-Tasks-Queue'
}

{ #category : #initialization }
J2TaskQueue >> clearQueue [
	self runLevelInterval
		do: [ :e | 
			queue at: e put: LinkedList new.
			inQueue at: e put: Set new ]
]

{ #category : #enqueuing }
J2TaskQueue >> enqueue: aTask [
	"The task knows if has to be enqueue in the queue. Maybe there is nothing to do."
	(aTask shouldEnqueue)
		ifTrue:
			[  "If a equal task is found then it has to be merged, if not it's added to the queue" 
				self merge: aTask orDo:
					[ 
					(queue at: aTask runLevel) addLast: aTask.
					(inQueue at: aTask runLevel) add: aTask ] ]
]

{ #category : #private }
J2TaskQueue >> findInQueue: aTask [
	| s |
	s := inQueue at: aTask runLevel.
	^s array at: (s scanFor: aTask).
	
]

{ #category : #private }
J2TaskQueue >> handleError: anError onTask: aTask [
	(aTask class canPerform: #onError:)
		ifTrue: [ aTask onError: anError ]
		ifFalse: [ self notifier onError: anError ]
]

{ #category : #accessing }
J2TaskQueue >> hasTasks [
	^ queue values anySatisfy: [ :e | e isNotEmpty ]
]

{ #category : #initialization }
J2TaskQueue >> initialize [
	super initialize.
	queue := Dictionary new: self numberOfRunLevels.
	inQueue := Dictionary new: self numberOfRunLevels.
	
	runStart := 0.
	self clearQueue.
]

{ #category : #enqueuing }
J2TaskQueue >> merge: aTask orDo: aBlock [
	| anotherTask | 
	anotherTask := self findInQueue: aTask.
	anotherTask ifNil: aBlock ifNotNil:[ 
		anotherTask mergeWith: aTask].
]

{ #category : #accessing }
J2TaskQueue >> notifier [
	^ notifier
]

{ #category : #accessing }
J2TaskQueue >> notifier: anObject [
	notifier := anObject
]

{ #category : #initialization }
J2TaskQueue >> numberOfRunLevels [
	^ 5
]

{ #category : #accessing }
J2TaskQueue >> pendingTasksStatistics [
	^ ', ' join: (queue associations collect: [ :e | e key asString , ':', e value size asString  ]).

]

{ #category : #private }
J2TaskQueue >> pickTaskToExecute [
	| x |
	self runLevelInterval
		do: [ :e | 
			(queue at: e)
				ifNotEmpty: [ 
					x := (queue at: e) removeFirst.
					(inQueue at:e) remove: x.
					^ x ] ].
	CollectionIsEmpty signal
]

{ #category : #running }
J2TaskQueue >> runAndWait [
	"Run all the pending tasks and all the generated lated  without returning the control"
	notifier startingProcess.

	runStart := Time microsecondClockValue.
	runTasks := 0.
	[ self hasTasks ] whileTrue: [ self runOne ].

	notifier logStatistics.
	notifier endProcess.
	
	self clearQueue.

]

{ #category : #private }
J2TaskQueue >> runLevelInterval [
	^(1 to: self numberOfRunLevels)
]

{ #category : #running }
J2TaskQueue >> runOne [
	"Runs the first task in the queue."

	| currentTask speed |
	currentTask := self pickTaskToExecute.
	[ currentTask execute.]
		on: Error
		do: [ :e | self handleError: e onTask: currentTask ].
	runTasks := runTasks + 1.
	runTasks \\ 1000 = 0
		ifTrue:
			[ 
			speed := (runTasks / (Time microsecondClockValue - runStart) * 1e6) asFloat.
			notifier pendingTasks: queue size speed: speed.
			Processor yield ]
]

{ #category : #accessing }
J2TaskQueue >> size [
	^ queue values sum: #size.
]
