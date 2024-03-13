"
A Class to test if the chaining of messages can be correctly infered.
"
Class {
	#name : #J2MessageChaining,
	#superclass : #Object,
	#instVars : [
		'aValue'
	],
	#category : 'J2Inferer-Tests-TestCode-Messages'
}

{ #category : #tests }
J2MessageChaining >> aMessage [.
	^ aValue
]

{ #category : #tests }
J2MessageChaining >> aThirdMessage [
	| aLocal |
	aLocal := 23.
	aLocal odd.
	aLocal even.
	aLocal
		+ 7;
		* 5;
		floor
]

{ #category : #accessing }
J2MessageChaining >> aValue: anObject [
	aValue := anObject
]

{ #category : #tests }
J2MessageChaining >> anotherMessage: x [
	x aMessage , 'asds'.
	^ x
]
