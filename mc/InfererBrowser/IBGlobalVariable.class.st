Class {
	#name : #IBGlobalVariable,
	#superclass : #IBVariable,
	#category : #InfererBrowser
}

{ #category : #'as yet unclassified' }
IBGlobalVariable >> modelType [

	^ 'Global variable'
]

{ #category : #accessing }
IBGlobalVariable >> title [
	^ 'Global ', self element name
]
