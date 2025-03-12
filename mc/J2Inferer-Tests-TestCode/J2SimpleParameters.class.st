"
Testing what happen when we have a message outside the same Hierarchy and inside.
"
Class {
	#name : #J2SimpleParameters,
	#superclass : #Object,
	#instVars : [
		'aVariable'
	],
	#category : 'J2Inferer-Tests-TestCode-Messages'
}

{ #category : #accessing }
J2SimpleParameters >> aVariable [
	^ aVariable
]

{ #category : #accessing }
J2SimpleParameters >> aVariable: anObject [
	aVariable := anObject
]

{ #category : #accessing }
J2SimpleParameters >> initialize [
	super initialize.
	self aVariable: 23.
]
