Class {
	#name : #IBMessage,
	#superclass : #IBVariable,
	#category : #InfererBrowser
}

{ #category : #'as yet unclassified' }
IBMessage >> modelType [

	^ 'Message'
]

{ #category : #'as yet unclassified' }
IBMessage >> name [
	^ self element printString
]

{ #category : #'as yet unclassified' }
IBMessage >> title [
	^ self element printString
]
