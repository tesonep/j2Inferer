"
A bunch of useful class side messages to test and use the inference system.
"
Class {
	#name : #J2InferenceManager,
	#superclass : #Object,
	#classInstVars : [
		'stats'
	],
	#category : #'J2Inferer-Utils'
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
J2InferenceManager class >> findRelatedClassesTo: aSetOfClasses [

	| classes |
	classes := aSetOfClasses
	           ,
	           (aSetOfClasses flatCollectAsSet: [ :each |
		            each dependentClasses ]).
	classes addAll:
		(classes flatCollectAsSet: [ :each | each allSuperclasses ]).
	classes addAll: (classes
			 reject: [ :each | each isMeta ]
			 thenCollect: [ :each | each class ]).
	^ classes
]

{ #category : #scripts }
J2InferenceManager class >> findTransitiveRelatedClassesTo: aSetOfClasses [

	| repetitions originalClassesAmount classes |
	"each repetition may improve results at the cost of dramatically increasing time to run"
	repetitions := 1.
	
	classes := Set withAll: aSetOfClasses.
	repetitions timesRepeat: [
		originalClassesAmount := classes size.
		classes := self findRelatedClassesTo: classes ].
	^ classes
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
		J2Inferer withNotifier: J2StdOutNotifier new ].

	aPackage classes
		do: [ :e |
			J2Inferer instance enqueueClass: e.
			e isMeta ifFalse: [ J2Inferer instance enqueueClass: e class ] ]
		displayingProgress: [ :e | e name ].

	J2Inferer instance runAndWait.
	J2Inferer instance notifier close.
	^ J2Inferer instance
]

{ #category : #scripts }
J2InferenceManager class >> inferRelatedOfPackage: aPackage [

	| classesToInfer |
	J2Inferer instance ifNil: [
		J2Inferer withNotifier: J2StdOutNotifier new ].

	classesToInfer := self findTransitiveRelatedClassesTo:
		                  aPackage classes asSet.

	classesToInfer
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
