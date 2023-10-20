"
This is a special kind of J2Class used for the Metaclass entitites.
"
Class {
	#name : #J2Metaclass,
	#superclass : #J2Class,
	#instVars : [
		'baseClass'
	],
	#category : 'J2Inferer-Variables'
}

{ #category : #'as yet unclassified' }
J2Metaclass >> fill [
	super fill.
	self fillBaseClass.
]

{ #category : #'as yet unclassified' }
J2Metaclass >> fillBaseClass [
	baseClass := self inferer
		typeInfoFor: self analysedClass instanceSide
]

{ #category : #'as yet unclassified' }
J2Metaclass >> fillVariables [
	" Nothing to do, the variables are in the class"
]

{ #category : #'as yet unclassified' }
J2Metaclass >> instanceVariable: aName [
	^ baseClass instanceVariable: aName
]

{ #category : #'as yet unclassified' }
J2Metaclass >> variableFor: aNode [
	^ baseClass variableFor: aNode 
]

{ #category : #'as yet unclassified' }
J2Metaclass >> variableFor: aNode ifAbsent: aValuable [
	^ baseClass variableFor: aNode ifAbsent: aValuable.
]
