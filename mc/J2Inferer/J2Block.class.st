"
A type variable for a Block. 
it contains a return type, and possible parameters and also is analysed in this own context.
"
Class {
	#name : #J2Block,
	#superclass : #J2Expression,
	#traits : 'TJ2WithParameters',
	#classTraits : 'TJ2WithParameters classTrait',
	#instVars : [
		'parameters',
		'index',
		'returnValue'
	],
	#category : 'J2Inferer-Variables'
}

{ #category : #'as yet unclassified' }
J2Block class >> index: anIndex blockNode: aBlockNode onClass: aClass [
	^ self basicNew
		container: aClass;
		index: anIndex;
		fillReturn;
		fillParameters: aBlockNode;
		relateParametersToSelf;
		yourself
]

{ #category : #'as yet unclassified' }
J2Block class >> new [
	^ self error: 'Use #index:blockNode:'
]

{ #category : #blocks }
J2Block >> blocksOn: aContext alreadyEvaluated: alreadyEvaluated [
	^ {self}.
]

{ #category : #accessing }
J2Block >> elements [
	^ self returnValue elements.
]

{ #category : #initialize }
J2Block >> fillReturn [
	returnValue := (J2Variable newOnClass: self classTypeInfo )
		variableName: '^';
		yourself
]

{ #category : #accessing }
J2Block >> generateMinClassesInContext: aContext alreadyEvaluated: alreadyEvaluated [
	^ J2Type withClass:( self inferer typeInfoFor: BlockClosure )
]

{ #category : #accessing }
J2Block >> index [
	^ index
]

{ #category : #accessing }
J2Block >> index: anObject [
	index := anObject
]

{ #category : #blocks }
J2Block >> isBlockOn: aContext alreadyEvaluated: alreadyEvaluated [
	^ true.
]

{ #category : #accessing }
J2Block >> parameters [
	^ parameters ifNil:[#()]
]

{ #category : #accessing }
J2Block >> parameters: aValue [
	parameters := aValue.
]

{ #category : #printing }
J2Block >> printOn: aStream [
	aStream
		nextPutAll: 'a J2Block (';
		nextPutAll: index printString;
		nextPut: $)
]

{ #category : #accessing }
J2Block >> relateParametersToSelf [
	self parameters doWithIndex: [
		:e :parameterIndex | e addSubtype: (J2BlockParameter for: self index: parameterIndex)
	]
]

{ #category : #accessing }
J2Block >> returnValue [
	^ returnValue
]
