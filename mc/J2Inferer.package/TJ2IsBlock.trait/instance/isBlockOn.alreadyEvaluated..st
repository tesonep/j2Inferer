blocks
isBlockOn: aContext alreadyEvaluated: alreadyEvaluated
	(alreadyEvaluated includes: self)
		ifTrue: [ ^ false ].
	alreadyEvaluated add: self.
	^ self doIsBlockOn: aContext alreadyEvaluated: alreadyEvaluated