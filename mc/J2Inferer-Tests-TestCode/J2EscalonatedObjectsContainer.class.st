"
Classes to test if the invocation to basicNew and basicNew: is correctly handled.
"
Class {
	#name : #J2EscalonatedObjectsContainer,
	#superclass : #Object,
	#instVars : [
		'a',
		'b'
	],
	#category : 'J2Inferer-Tests-TestCode-Escalonated'
}

{ #category : #'as yet unclassified' }
J2EscalonatedObjectsContainer >> objectA [
	^ a ifNil:[ a:=J2EscalonatedObjectsContainerA new ].
]

{ #category : #'as yet unclassified' }
J2EscalonatedObjectsContainer >> objectB [
	^ b ifNil:[ b:= self objectA createObjectB ].
]
