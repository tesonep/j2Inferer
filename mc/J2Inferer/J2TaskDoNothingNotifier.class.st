"
This Task notifier, as its name says does not a thing when a problem is reported.
"
Class {
	#name : #J2TaskDoNothingNotifier,
	#superclass : #J2AbstractTaskNotifier,
	#category : 'J2Inferer-Tasks-Queue'
}

{ #category : #events }
J2TaskDoNothingNotifier >> endProcess [
	"Nothing should be done".
]

{ #category : #events }
J2TaskDoNothingNotifier >> logStatistics [
	"Nothing should be done"
]

{ #category : #'as yet unclassified' }
J2TaskDoNothingNotifier >> onError: anError [
	"I do nothing!"
]

{ #category : #events }
J2TaskDoNothingNotifier >> startingProcess [
	"Nothing should be done :D".
]
