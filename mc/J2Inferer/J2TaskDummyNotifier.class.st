"
A J2TaskDummyNotifier is notifier that not really do a thing.

"
Class {
	#name : 'J2TaskDummyNotifier',
	#superclass : 'J2AbstractTaskNotifier',
	#category : 'J2Inferer-Tasks-Queue',
	#package : 'J2Inferer',
	#tag : 'Tasks-Queue'
}

{ #category : 'error handling' }
J2TaskDummyNotifier >> onError: anError [
	anError pass
]
