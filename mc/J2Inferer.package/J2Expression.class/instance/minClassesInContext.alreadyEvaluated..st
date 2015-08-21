accessing
minClassesInContext: aContext alreadyEvaluated: alreadyEvaluated
	(alreadyEvaluated includes: self)
		ifTrue: [ 
			^ alreadyCalculated ifNil:#().
		].
	alreadyEvaluated add: self.
	alreadyCalculated := self filterByMessages: (self generateMinClassesInContext: aContext alreadyEvaluated: alreadyEvaluated).
	^alreadyCalculated