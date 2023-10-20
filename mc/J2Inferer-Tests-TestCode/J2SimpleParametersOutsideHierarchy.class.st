"
Testing what happen when we have a message outside the same Hierarchy and inside.
"
Class {
	#name : #J2SimpleParametersOutsideHierarchy,
	#superclass : #Object,
	#instVars : [
		'aValue'
	],
	#category : 'J2Inferer-Tests-TestCode-Messages'
}

{ #category : #'as yet unclassified' }
J2SimpleParametersOutsideHierarchy >> simpleMessage [
	| aLocal |
	aLocal := J2SimpleMessageOutsideHierarchy new.
	aLocal aMessage: aValue.
]
