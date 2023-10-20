"
The containers are used during the AST processing to maintain only one instance of a variable to two equivalent expressions. 

The containers can be structured in a herarchical way. 
If a container does not have an expression should ask it parent before adding a new one.
"
Class {
	#name : #J2AbstractContainer,
	#superclass : #Object,
	#instVars : [
		'inferer'
	],
	#category : 'J2Inferer-AST'
}

{ #category : #accessing }
J2AbstractContainer >> inferer [
	^ J2Inferer instance
]
