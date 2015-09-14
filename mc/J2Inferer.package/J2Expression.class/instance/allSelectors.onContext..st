accessing
allSelectors: alreadyEvaluated onContext: aContext
	(alreadyEvaluated includes: self)
		ifTrue: [ ^ #() ].
	alreadyEvaluated add: self.
	^ (self supertypes flatCollect: [ :e | e allSelectors: alreadyEvaluated onContext: aContext ]) , self selectors