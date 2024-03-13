"
This implementation does nothing in the events. It's useful to be used in the tests.
"
Class {
	#name : #J2NullNotifier,
	#superclass : #J2AbstractNotifier,
	#category : 'J2Inferer'
}

{ #category : #logging }
J2NullNotifier >> doLog: aValuable level: logLevel [.
	"Nothing is done in this!"
]
