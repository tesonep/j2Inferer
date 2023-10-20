"
Represents the elements inside an array Literal
"
Class {
	#name : #J2ArrayLiteralElements,
	#superclass : #J2AbstractSharedTypeVariables,
	#instVars : [
		'types'
	],
	#category : 'J2Inferer-Variables'
}

{ #category : #comparing }
J2ArrayLiteralElements >> = anotherObject [
	^ self types = anotherObject types
]

{ #category : #comparing }
J2ArrayLiteralElements >> hash [
	^ types hash
]

{ #category : #accessing }
J2ArrayLiteralElements >> minClassesInContext: aContext alreadyEvaluated: alreadyEvaluated [
	^ J2Type withClasses: types
]

{ #category : #accessing }
J2ArrayLiteralElements >> types [
	^ types
]

{ #category : #accessing }
J2ArrayLiteralElements >> types: anObject [
	types := anObject
]
