accessing
allSelectors: alreadyEvaluated onContext: context
	| all |
	(alreadyEvaluated includes: self)
		ifTrue: [ ^ #() ].
	alreadyEvaluated add: self.

	all := Set new.
	(self message methodsForReceivingContext: context)
		do:
			[ :e | all addAll: ((e parameters at: index) allSelectors: alreadyEvaluated onContext: context) ].
	^ all