"
A hierarchy to test inheritance
"
Class {
	#name : #J2ChildClass,
	#superclass : #J2ParentClass,
	#instVars : [
		'anotherClass',
		'anotherObject'
	],
	#category : 'J2Inferer-Tests-TestCode-Inheritance'
}

{ #category : #'as yet unclassified' }
J2ChildClass >> aMethod [
	^aParentVariable 
]

{ #category : #'as yet unclassified' }
J2ChildClass >> initialize [
	anotherClass := J2SimpleClass.
	anotherObject := anotherClass new
]
