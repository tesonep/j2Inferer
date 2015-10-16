blocks
isBlockOn: aContext alreadyEvaluated: alreadyEvaluated
	(alreadyEvaluated includes: self)
		ifTrue: [ ^ false ].
	alreadyEvaluated add: self.
	^ self doBlockOn: aContext alreadyEvaluated: alreadyEvaluated