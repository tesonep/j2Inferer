accessing
allMessages: alreadyEvaluated
	(alreadyEvaluated includes: self)
		ifTrue: [ ^ #() ].
	alreadyEvaluated add: self.
	^ (self supertypes flatCollect: [ :e | e allMessages: alreadyEvaluated ]) , self messages