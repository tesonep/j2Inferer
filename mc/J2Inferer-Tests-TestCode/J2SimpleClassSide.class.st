"
Simple class side behavior for testing the inferer.
"
Class {
	#name : #J2SimpleClassSide,
	#superclass : #Object,
	#classVars : [
		'aClassVariable'
	],
	#category : 'J2Inferer-Tests-TestCode-Simple'
}

{ #category : #'as yet unclassified' }
J2SimpleClassSide class >> aMethod [
	aClassVariable := 23.
]

{ #category : #'as yet unclassified' }
J2SimpleClassSide >> anAccessor [
	^ aClassVariable
]
