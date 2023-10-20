"
This class has all the common behavior between all the Notifiers.
"
Class {
	#name : #J2AbstractNotifier,
	#superclass : #Object,
	#instVars : [
		'inferer',
		'logLevels',
		'currentLogLevel',
		'startTime',
		'endTime'
	],
	#category : 'J2Inferer'
}

{ #category : #logging }
J2AbstractNotifier >> doLog: aValuable level: logLevel [.
	self subclassResponsibility 
]

{ #category : #events }
J2AbstractNotifier >> endProcess [
	endTime := DateAndTime now.
	self log:['Process Finished. It took: ' , (endTime - startTime) asString ] level:#info.

]

{ #category : #events }
J2AbstractNotifier >> enqueueMethod: aMethod [
	self log:['Enqueueing a method: ', aMethod name] level:#debug.
]

{ #category : #events }
J2AbstractNotifier >> fillingClass: aClass [ 
		self log: ['Filling Class:', aClass name] level:#debug.
]

{ #category : #events }
J2AbstractNotifier >> generatedClass: aClass [ 
	self log: ['Generated Class:', aClass name] level:#debug
]

{ #category : #events }
J2AbstractNotifier >> generatingClass: aClass [ 
	self log: ['Generating Class:', aClass name] level:#debug
]

{ #category : #logging }
J2AbstractNotifier >> hasToLog: level [
	| levelValue |
	levelValue := logLevels at:level ifAbsent:9.
	^ currentLogLevel >= levelValue.
]

{ #category : #accessing }
J2AbstractNotifier >> inferer [
	^ inferer
]

{ #category : #accessing }
J2AbstractNotifier >> inferer: anObject [
	inferer := anObject
]

{ #category : #initialization }
J2AbstractNotifier >> initialize [
	super initialize.
	logLevels:=Dictionary new.
	logLevels at:#error put:1. 
	logLevels at:#info put:2. 
	logLevels at:#debug put:3.
	logLevels at:#trace put:4.
	currentLogLevel := 2.

]

{ #category : #logging }
J2AbstractNotifier >> log: aValuable level:logLevel [
	(self hasToLog: logLevel) ifFalse: [ ^self ].
	^self doLog: aValuable level:logLevel.

]

{ #category : #logging }
J2AbstractNotifier >> logClasses [
	| ordered |.
	ordered := SortedCollection new.
	inferer classes do: [ :c | ordered add: String tab , c printString ].
	ordered do:[:e | self log:e level:#info].
]

{ #category : #logging }
J2AbstractNotifier >> logStatistics [
	self log: [inferer statistics] level:#info.
]

{ #category : #events }
J2AbstractNotifier >> onError: anError [
	anError pass.
]

{ #category : #events }
J2AbstractNotifier >> openMethod: aMethod [ 
	self log: ['Method Opened:', aMethod name] level:#debug
]

{ #category : #events }
J2AbstractNotifier >> openingMessage: aMessage [
	self log: ['Opening a Message:' , aMessage selector] level:#debug
]

{ #category : #events }
J2AbstractNotifier >> openingMethod: aMethod [ 
	self log:['Opening Method:', aMethod name] level:#debug
]

{ #category : #events }
J2AbstractNotifier >> pendingTasks: numberOfTasks speed: speed [
	self log:[inferer statistics , ' speed: ' , speed asString] level:#info
]

{ #category : #events }
J2AbstractNotifier >> startingProcess [
	startTime := DateAndTime now.
	self log:['Starting inferer process'] level:#info
]
