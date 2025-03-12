"
A hierarchy to test inheritance
"
Class {
	#name : #J2ParentClass,
	#superclass : #Object,
	#instVars : [
		'aParentVariable'
	],
	#category : 'J2Inferer-Tests-TestCode-Inheritance'
}

{ #category : #accessing }
J2ParentClass >> aMethodCallingChild [
	^ self aMethod.
]

{ #category : #accessing }
J2ParentClass >> aParentVariable [
	^ aParentVariable
]

{ #category : #accessing }
J2ParentClass >> aParentVariable: anObject [
	aParentVariable := anObject
]

{ #category : #accessing }
J2ParentClass >> initialize [
	super initialize.
	aParentVariable := 1.
]
