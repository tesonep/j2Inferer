"
Represents a basic task in the algortihm.

Each task can compare to the others to see if it is duplicated, can merge with another to only have 1 task per type and nows if it has to be enqueue in the task. A task can't be enqueue for example if the method is already updated.

Each task has a default runLevel, because the runner has priorities
"
Class {
	#name : #J2AbstractTask,
	#superclass : #Object,
	#instVars : [
		'inferer'
	],
	#category : 'J2Inferer-Tasks'
}

{ #category : #comparing }
J2AbstractTask >> = anotherTask [
	self subclassResponsibility.
]

{ #category : #comparing }
J2AbstractTask >> compareToAllMethodsUpdated: anotherTask [
	^ false.
]

{ #category : #comparing }
J2AbstractTask >> compareToOpenMethodFromMessage: anotherTask [
	^ false.
]

{ #category : #comparing }
J2AbstractTask >> compareToOpenMethodTask:anotherTask [
	^false.
]

{ #category : #comparing }
J2AbstractTask >> compareToRelateParameters: anotherTask [
	^ false.
]

{ #category : #executing }
J2AbstractTask >> execute [
	self subclassResponsibility.
]

{ #category : #comparing }
J2AbstractTask >> hash [
	^self subclassResponsibility
]

{ #category : #accessing }
J2AbstractTask >> inferer [
	^ J2Inferer instance
]

{ #category : #executing }
J2AbstractTask >> mergeWith: anotherTask [
	^ self subclassResponsibility
]

{ #category : #accessing }
J2AbstractTask >> runLevel [
	^ self subclassResponsibility
]

{ #category : #accessing }
J2AbstractTask >> shouldEnqueue [
	^ self subclassResponsibility 
]
