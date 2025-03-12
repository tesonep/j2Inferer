"
Classes to test if the invocation to basicNew and basicNew: is correctly handled.
"
Class {
	#name : #J2EscalonatedObjectsContainerA,
	#superclass : #Object,
	#category : 'J2Inferer-Tests-TestCode-Escalonated'
}

{ #category : #'as yet unclassified' }
J2EscalonatedObjectsContainerA >> createObjectB [
	^ J2EscalonatedObjectsContainerB new.
]
