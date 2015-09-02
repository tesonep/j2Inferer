accessing
allMessages: alreadyEvaluated onContext: aContext
	(alreadyEvaluated includes: self)
		ifTrue: [ ^ #() ].
	alreadyEvaluated add: self.
	^ (self supertypes flatCollect: [ :e | e allMessages: alreadyEvaluated onContext: aContext ]) , self messages