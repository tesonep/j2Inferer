"
A global variable. It has a special behavior compared with the J2Variable.
"
Class {
	#name : #J2GlobalVariable,
	#superclass : #J2Variable,
	#category : 'J2Inferer-Variables'
}

{ #category : #'as yet unclassified' }
J2GlobalVariable class >> new [
	^ self newOnClass: nil.
]

{ #category : #'as yet unclassified' }
J2GlobalVariable >> generateMinClassesInContext: aContext alreadyEvaluated: alreadyEvaluated [
	self error.
]

{ #category : #'as yet unclassified' }
J2GlobalVariable >> minClassesInContext: aContext alreadyEvaluated: alreadyEvaluated [
	| value |
	value := Smalltalk globals at: self name ifAbsent: [ ^ J2Type new ].
	^ value
		ifNotNil: [ J2Type withClass: (self inferer typeInfoFor: value class) ]
		ifNil: [ J2Type new ]
]
