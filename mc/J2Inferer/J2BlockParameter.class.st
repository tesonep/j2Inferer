Class {
	#name : #J2BlockParameter,
	#superclass : #Object,
	#instVars : [
		'block',
		'index'
	],
	#category : #'J2Inferer-Variables'
}

{ #category : #'instance creation' }
J2BlockParameter class >> for: aJ2Block index: anIndex [
	^self new
			block: aJ2Block;
			index: anIndex;
			yourself.
]

{ #category : #accessing }
J2BlockParameter >> addSupertype: aVariable [
	"Nothing to do"
]

{ #category : #accessing }
J2BlockParameter >> block [
	^ block
]

{ #category : #accessing }
J2BlockParameter >> block: anObject [
	block := anObject
]

{ #category : #accessing }
J2BlockParameter >> blocksOn: aContext alreadyEvaluated: alreadyEvaluated [
	"I propagate the evaluation to the actual parameter in the block"

	^ (self block parameters at: index)
		  blocksOn: aContext
		  alreadyEvaluated: alreadyEvaluated
]

{ #category : #accessing }
J2BlockParameter >> index [
	^ index
]

{ #category : #accessing }
J2BlockParameter >> index: anObject [
	index := anObject
]

{ #category : #accessing }
J2BlockParameter >> isBlockOn: aContext alreadyEvaluated: alreadyEvaluated [
	"I propagate the evaluation to the actual parameter in the block"

	^ (self block parameters at: index)
		  isBlockOn: aContext
		  alreadyEvaluated: alreadyEvaluated
]

{ #category : #accessing }
J2BlockParameter >> minClassesInContext: aContext alreadyEvaluated: alreadyEvaluated [
	"I propagate the evaluation to the actual parameter in the block"

	^ (self block parameters at: index)
		  minClassesInContext: aContext
		  alreadyEvaluated: alreadyEvaluated
]
