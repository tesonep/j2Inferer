"
A J2AbstractTaskNotifier is the object in charge of notifing the events in the task queue.

"
Class {
	#name : #J2AbstractTaskNotifier,
	#superclass : #Object,
	#category : 'J2Inferer-Tasks-Queue'
}

{ #category : #'error handling' }
J2AbstractTaskNotifier >> onError:anError [.
	self subclassResponsibility.
]

{ #category : #'error handling' }
J2AbstractTaskNotifier >> pendingTasks: numberOfTasks speed:speed [.
	
]
