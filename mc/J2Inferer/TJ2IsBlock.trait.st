"
This trait encapsulates the behavior of detecting blocks variables.
"
Trait {
	#name : #TJ2IsBlock,
	#category : 'J2Inferer-Variables'
}

{ #category : #blocks }
TJ2IsBlock >> blocksOn: aContext alreadyEvaluated: alreadyEvaluated [
	(alreadyEvaluated includes: self)
		ifTrue: [ ^ #() ].
	alreadyEvaluated add: self.
	^ self doBlocksOn: aContext alreadyEvaluated: alreadyEvaluated
]

{ #category : #blocks }
TJ2IsBlock >> isBlockOn: aContext alreadyEvaluated: alreadyEvaluated [
	(alreadyEvaluated includes: self)
		ifTrue: [ ^ false ].
	alreadyEvaluated add: self.
	^ self doIsBlockOn: aContext alreadyEvaluated: alreadyEvaluated
]
