blocks
blocksOn: aContext alreadyEvaluated: alreadyEvaluated
	(alreadyEvaluated includes: self)
		ifTrue: [ ^ #() ].
	alreadyEvaluated add: self.
	^ self doBlocksOn: aContext alreadyEvaluated: alreadyEvaluated