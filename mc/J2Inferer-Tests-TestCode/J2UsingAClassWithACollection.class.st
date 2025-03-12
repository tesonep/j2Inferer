"
These objects uses a J2AClassWithACollection
"
Class {
	#name : #J2UsingAClassWithACollection,
	#superclass : #Object,
	#instVars : [
		'anObject'
	],
	#category : 'J2Inferer-Tests-TestCode-Collections'
}

{ #category : #accessing }
J2UsingAClassWithACollection >> any [
	^ anObject aBag anyOne.
]

{ #category : #'as yet unclassified' }
J2UsingAClassWithACollection >> initialize [
	super initialize.
	anObject := J2AClassWithACollection new.
	anObject addObject: 1.
	anObject addObject: 2.
]
