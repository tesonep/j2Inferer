Class {
	#name : #J2TaskQueueTest,
	#superclass : #TestCase,
	#instVars : [
		'taskQueue',
		'numberOfSuccess',
		'numberOfFailures',
		'numberOfErrorHandled'
	],
	#category : 'J2Inferer-Tests-Tasks'
}

{ #category : #tests }
J2TaskQueueTest >> reportErrorHandled [
	numberOfErrorHandled := numberOfErrorHandled + 1.
]

{ #category : #tests }
J2TaskQueueTest >> reportFailure [
	numberOfFailures := numberOfFailures + 1.
]

{ #category : #tests }
J2TaskQueueTest >> reportSuccess [
	numberOfSuccess := numberOfSuccess + 1.
]

{ #category : #running }
J2TaskQueueTest >> setUp [
	super setUp.
	self taskQueue: J2TaskQueue new.
	self taskQueue notifier: J2TaskDoNothingNotifier new.
	numberOfSuccess := 0.
	numberOfFailures := 0.
	numberOfErrorHandled := 0.
]

{ #category : #accessing }
J2TaskQueueTest >> taskQueue [
	^ taskQueue
]

{ #category : #accessing }
J2TaskQueueTest >> taskQueue: anObject [
	taskQueue := anObject
]

{ #category : #tests }
J2TaskQueueTest >> testRunAllOnEmptyQueue [
	self taskQueue runAndWait.
	self assert: numberOfSuccess = 0.
	self assert: numberOfFailures = 0.
	self assert: numberOfErrorHandled = 0.
]

{ #category : #tests }
J2TaskQueueTest >> testRunManyFailures [
	self taskQueue enqueue: (J2DummyTask failsOn: self).
	self taskQueue enqueue: (J2DummyTask failsOn: self).
	self taskQueue enqueue: (J2DummyTask failsOn: self).
	
	self taskQueue runAndWait.
	
	self assert: numberOfSuccess = 0.
	self assert: numberOfFailures = 3.
	self assert: numberOfErrorHandled = 0
]

{ #category : #tests }
J2TaskQueueTest >> testRunManySuccess [.
	self taskQueue enqueue: (J2DummyTask successOn:self).
	self taskQueue enqueue: (J2DummyTask successOn:self).
	self taskQueue enqueue: (J2DummyTask successOn:self).	
	self taskQueue runAndWait.
	
	self assert: numberOfSuccess = 3.
	self assert: numberOfFailures = 0.
	self assert: numberOfErrorHandled = 0.	
]

{ #category : #tests }
J2TaskQueueTest >> testRunMixed [.
	self taskQueue enqueue: (J2DummyTask failsOn:self).
	self taskQueue enqueue: (J2DummyTask failsOn:self).
	self taskQueue enqueue: (J2DummyTask failsOn:self).	
	self taskQueue enqueue: (J2DummyTask successOn:self).
	self taskQueue enqueue: (J2DummyTask successOn:self).			
	self taskQueue runAndWait.
	
	self assert: numberOfSuccess = 2.
	self assert: numberOfFailures = 3.
	self assert: numberOfErrorHandled = 0.
]

{ #category : #tests }
J2TaskQueueTest >> testRunOnEmptyQueue [
	self should: [ self taskQueue runOne ] raise: CollectionIsEmpty.
]

{ #category : #tests }
J2TaskQueueTest >> testRunWithErrorHandling [.
	self taskQueue enqueue: (J2DummyTask failsOn:self).
	self taskQueue enqueue: (J2DummyTask failsOn:self).
	self taskQueue enqueue: (J2DummyTask failsOn:self).	
	self taskQueue enqueue: (J2DummyTaskWithErrorHandler  successOn:self).
	self taskQueue enqueue: (J2DummyTask successOn:self).			
	self taskQueue enqueue: (J2DummyTaskWithErrorHandler  failsOn:self).
	self taskQueue enqueue: (J2DummyTaskWithErrorHandler  failsOn:self).
	self taskQueue enqueue: (J2DummyTaskWithErrorHandler  failsOn:self).
	self taskQueue runAndWait.
	
	self assert: numberOfSuccess = 2.
	self assert: numberOfFailures = 6.
	self assert: numberOfErrorHandled = 3.
]
