"
Testing the basic subtyping rules.
"
Class {
	#name : #J2SubtypingTestClass,
	#superclass : #Object,
	#instVars : [
		'anotherVariable',
		'aVariable'
	],
	#category : 'J2Inferer-Tests-TestCode-Simple'
}

{ #category : #'as yet unclassified' }
J2SubtypingTestClass >> assigningALiteral [
	| aLocal |
	aLocal := 23. 
	^ aLocal + 3.
]

{ #category : #'as yet unclassified' }
J2SubtypingTestClass >> assigningAValue [
	aVariable := anotherVariable.
	^aVariable.
]

{ #category : #'as yet unclassified' }
J2SubtypingTestClass >> senderMessage [
	| passedByParameter |
	self sentMessage: passedByParameter.
]

{ #category : #'as yet unclassified' }
J2SubtypingTestClass >> sentMessage: aParameter [
	aParameter aMessageToParameter.
]

{ #category : #'as yet unclassified' }
J2SubtypingTestClass >> storingReturnedValue [
	| aLocal |
	aLocal := self assigningAValue. 
]
