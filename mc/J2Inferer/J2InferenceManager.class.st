"
A bunch of useful class side messages to test and use the inference system.
"
Class {
	#name : #J2InferenceManager,
	#superclass : #Object,
	#classInstVars : [
		'stats'
	],
	#category : 'J2Inferer-Utils'
}

{ #category : #scripts }
J2InferenceManager class >> clearInferer [
	J2Inferer resetInstance.
]

{ #category : #scripts }
J2InferenceManager class >> deserializeFromFile: aFileName [
	| aStream materializer | 
	aStream := GZipReadStream on: (FileStream fileNamed: aFileName). 
	materializer := FLMaterializer newDefault.
	
	J2Inferer instance: (materializer materializeFrom: aStream) root.
		
	aStream close.
	
	^ J2Inferer instance.
	
]

{ #category : #scripts }
J2InferenceManager class >> inferAllInstalation [
	" J2Scripts inferAllInstalation"

	J2Inferer resetInstance.
	Smalltalk garbageCollect.
	J2Inferer withNotifier: J2StdOutNotifier new.

	ProtoObject withAllSubclasses
		do: [ :e | J2Inferer instance enqueueClass: e ]
		displayingProgress: [ :e | e name ].
		
	J2Inferer instance runAndWait.
	J2Inferer instance notifier close.
	
	^ J2Inferer instance
]

{ #category : #scripts }
J2InferenceManager class >> inferPackage: aPackage [
	J2Inferer instance ifNil: [ 
			J2Inferer withNotifier: J2StdOutNotifier new.
		].

	aPackage classes
		do: [ :e | J2Inferer instance enqueueClass: e ]
		displayingProgress: [ :e | e name ].
		
	J2Inferer instance runAndWait.
	J2Inferer instance notifier close.
	^ J2Inferer instance
]

{ #category : #scripts }
J2InferenceManager class >> serializeToFile: aFileName [
	| aStream  serializer | 
	aStream := GZipWriteStream on: (File named: aFileName) writeStream. 
	serializer := FLSerializer newDefault.
	serializer stream: aStream.
	serializer serialize: J2Inferer instance.
	aStream close.
]
