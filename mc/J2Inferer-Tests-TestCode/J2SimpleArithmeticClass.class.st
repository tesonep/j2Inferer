"
Some simple arithmetic code.
"
Class {
	#name : #J2SimpleArithmeticClass,
	#superclass : #Object,
	#instVars : [
		'aVariable'
	],
	#category : 'J2Inferer-Tests-TestCode-Simple'
}

{ #category : #'test-code' }
J2SimpleArithmeticClass >> simpleMessageReturningAnAddition [
	^ 2 + 3.
]

{ #category : #'test-code' }
J2SimpleArithmeticClass >> simpleMessageReturningAnAdditionAVariable [
	aVariable := 7. 
	^ aVariable + 3
]
