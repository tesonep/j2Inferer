"
This object is the responsible for listening all events in the J2Inferer implementation. 
All the J2Expressions, all the tasks, the task queue and the inferer will delegate in this object  the responsability to log the events that matters.

This implementation logs in a file the information received.

All the logged events are in the ""events "" protocol.
"
Class {
	#name : #J2FileBasedNotifier,
	#superclass : #J2AbstractNotifier,
	#instVars : [
		'stream',
		'file'
	],
	#category : 'J2Inferer'
}

{ #category : #'file-handling' }
J2FileBasedNotifier >> close [
	stream close.
]

{ #category : #logging }
J2FileBasedNotifier >> doLog: aValuable level: logLevel [.
	stream << aValuable value.
	stream crlf.
	stream flush
]

{ #category : #initialization }
J2FileBasedNotifier >> initialize [
	super initialize.
	self openLogFile
]

{ #category : #'file-handling' }
J2FileBasedNotifier >> openLogFile [
	file := File new
		named: 'salida.out';
		yourself.
	file openForWrite.
	stream := file writeStream
]

{ #category : #events }
J2FileBasedNotifier >> startingProcess [
	self openLogFile.
	super startingProcess
]
