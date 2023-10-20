"
This is the dara object contained in the J2ImplemnentorsRegistry, look at it for details of using.
"
Class {
	#name : #J2Implementors,
	#superclass : #Object,
	#instVars : [
		'methods'
	],
	#category : 'J2Inferer-Implementors'
}

{ #category : #accessing }
J2Implementors >> add: aMethod [
	| s |
	s := IdentitySet new: self methods size + 1.
	s addAll: self methods.
	s add: aMethod.
	methods := s asArray.
]

{ #category : #accessing }
J2Implementors >> initialize [
	super initialize.
	self methods: #().
]

{ #category : #accessing }
J2Implementors >> methods [
	^ methods
]

{ #category : #accessing }
J2Implementors >> methods: anObject [
	methods := anObject
]

{ #category : #accessing }
J2Implementors >> size [
	^ methods size
]
