Class {
	#name : #IBExpression,
	#superclass : #IBVariable,
	#category : #InfererBrowser
}

{ #category : #'as yet unclassified' }
IBExpression >> modelType [

	^ 'Expression'
]

{ #category : #'as yet unclassified' }
IBExpression >> name [
	^ self element printString
]

{ #category : #'as yet unclassified' }
IBExpression >> title [
	^ self element printString
]
