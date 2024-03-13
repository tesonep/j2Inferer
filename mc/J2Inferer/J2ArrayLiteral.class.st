"
It Represents the type variable for a array literal.
This instances are reused through the algorithm.
"
Class {
	#name : #J2ArrayLiteral,
	#superclass : #J2AbstractSharedTypeVariables,
	#instVars : [
		'elements',
		'typeInfo'
	],
	#category : 'J2Inferer-Variables'
}

{ #category : #comparing }
J2ArrayLiteral >> = anotherArrayLiteral [
	anotherArrayLiteral ifNil:[ ^ false].
	(anotherArrayLiteral isKindOf: J2ArrayLiteral ) ifFalse: [ ^false ].
	^ elements = anotherArrayLiteral elements.
]

{ #category : #accessing }
J2ArrayLiteral >> elementTypes: anArrayOfTypes [
	elements := J2ArrayLiteralElements new.
	elements types: anArrayOfTypes.
]

{ #category : #accessing }
J2ArrayLiteral >> elements [
	^ elements
]

{ #category : #comparing }
J2ArrayLiteral >> hash [
	^ elements hash.
]

{ #category : #accessing }
J2ArrayLiteral >> minClassesInContext: aContext alreadyEvaluated: alreadyEvaluated [
	^ J2Type withClass: typeInfo 
]

{ #category : #printing }
J2ArrayLiteral >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $(.
	elements types printOn: aStream.
	aStream nextPut: $).
]

{ #category : #accessing }
J2ArrayLiteral >> typeInfo [
	^ typeInfo
]

{ #category : #accessing }
J2ArrayLiteral >> typeInfo: anObject [
	typeInfo := anObject
]
