"
An object representing the behavior of the literals.

There is only one instance per class of literals.
"
Class {
	#name : #J2Literal,
	#superclass : #J2AbstractSharedTypeVariables,
	#instVars : [
		'literalClass'
	],
	#category : 'J2Inferer-Variables'
}

{ #category : #accessing }
J2Literal >> literalClass [
	^ literalClass
]

{ #category : #accessing }
J2Literal >> literalClass: anObject [
	literalClass := anObject
]

{ #category : #accessing }
J2Literal >> minClassesInContext: aContext alreadyEvaluated: alreadyEvaluated [	
	^ J2Type withClass:literalClass
]

{ #category : #'as yet unclassified' }
J2Literal >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $(.
	literalClass printOn: aStream.
	aStream nextPut: $).
]
