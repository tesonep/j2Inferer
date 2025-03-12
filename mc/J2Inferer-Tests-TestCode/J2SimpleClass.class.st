"
Simple class for testing the inferer.
"
Class {
	#name : #J2SimpleClass,
	#superclass : #Object,
	#instVars : [
		'aVariable'
	],
	#category : 'J2Inferer-Tests-TestCode-Simple'
}

{ #category : #'test-code' }
J2SimpleClass >> aVariable [
	^aVariable
]

{ #category : #'test-code' }
J2SimpleClass >> aVariable: aValue [
	aVariable := aValue
]

{ #category : #'test-code' }
J2SimpleClass >> otherYourself [
	| y |
	y := Dictionary new.
	^ y
		at: 1 put: 'x';
		yourself
]

{ #category : #'test-code' }
J2SimpleClass >> recursiveMethod: aCondition [
	aCondition ifTrue:[^ #aSymbol] ifFalse:[^ self recursiveMethod:aCondition].
	
]

{ #category : #'test-code' }
J2SimpleClass >> setValueToAInstanceVariable [
	aVariable := 23
]

{ #category : #'test-code' }
J2SimpleClass >> simpleArray [
	^{aVariable. 24. #nice}
]

{ #category : #'test-code' }
J2SimpleClass >> simpleArrayLiteral [
	^ #(asd ddd 1 4)
]

{ #category : #'test-code' }
J2SimpleClass >> simpleMethodReturningAValue [
	| a |
	a := 57.
	^a.
]

{ #category : #'test-code' }
J2SimpleClass >> simpleSendingAMessage [
	^ self aVariable.
]
