"
A representation of the thisContext element.
"
Class {
	#name : #J2ThisContext,
	#superclass : #J2AbstractSharedTypeVariables,
	#instVars : [
		'type'
	],
	#category : 'J2Inferer-Variables'
}

{ #category : #'as yet unclassified' }
J2ThisContext >> minClassesInContext: aContext alreadyEvaluated: alreadyEvaluated [
	^ J2Type withClass:type
]

{ #category : #accessing }
J2ThisContext >> type [
	^ type
]

{ #category : #accessing }
J2ThisContext >> type: anObject [
	type := anObject
]
