"
A class holding a bag used in the tests to detect if the elements of a collection can be infered.
"
Class {
	#name : #J2AClassWithACollection,
	#superclass : #Object,
	#instVars : [
		'aBag'
	],
	#category : 'J2Inferer-Tests-TestCode-Collections'
}

{ #category : #'instance creation' }
J2AClassWithACollection class >> new [
	^ super new aBag: Bag new.
]

{ #category : #accessing }
J2AClassWithACollection >> aBag [
	^ aBag
]

{ #category : #accessing }
J2AClassWithACollection >> aBag: anObject [
	aBag := anObject
]

{ #category : #accessing }
J2AClassWithACollection >> addObject: anObject [
	aBag add:anObject.
]

{ #category : #accessing }
J2AClassWithACollection >> find: aName [
	aBag detect:[:e | e name = aName]
]
