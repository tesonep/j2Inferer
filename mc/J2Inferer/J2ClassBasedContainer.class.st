"
This class represents the container of the instance and global variables of a class. 
"
Class {
	#name : #J2ClassBasedContainer,
	#superclass : #J2AbstractContainer,
	#instVars : [
		'classVariable'
	],
	#category : 'J2Inferer-AST'
}

{ #category : #accessing }
J2ClassBasedContainer >> classVariable [
	^ classVariable
]

{ #category : #accessing }
J2ClassBasedContainer >> classVariable: anObject [
	classVariable := anObject
]

{ #category : #'accessing variables' }
J2ClassBasedContainer >> variableFor: aNode [ 
	^classVariable variableFor: aNode.
]
