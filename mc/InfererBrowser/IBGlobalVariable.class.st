Class {
	#name : #IBGlobalVariable,
	#superclass : #IBVariable,
	#category : 'InfererBrowser'
}

{ #category : #accessing }
IBGlobalVariable >> title [
	^ 'Global ', self element name
]
