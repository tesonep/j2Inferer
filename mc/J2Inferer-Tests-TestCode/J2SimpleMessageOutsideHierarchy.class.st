"
Testing what happen when we have a message outside the same Hierarchy and inside.
"
Class {
	#name : #J2SimpleMessageOutsideHierarchy,
	#superclass : #Object,
	#category : 'J2Inferer-Tests-TestCode-Messages'
}

{ #category : #accessing }
J2SimpleMessageOutsideHierarchy >> aMessage: anObject [
	anObject aMessageToParameter.
]
