accessing
minClassesInContext: aContext alreadyEvaluated: alreadyEvaluated
	| singleImplementor allSelectors |
	(alreadyEvaluated includes: self)
		ifTrue: [ 
			^ alreadyCalculated ifNil:#().
		].
	alreadyEvaluated add: self.
	alreadyCalculated := self filter: (self generateMinClassesInContext: aContext alreadyEvaluated: alreadyEvaluated) byMessages: self selectors .
	
	alreadyCalculated ifEmpty: [ 
		allSelectors := self allSelectors: IdentitySet new onContext: aContext.
		
		singleImplementor := self inferer singleImplementorOf: allSelectors.
		singleImplementor ifNotNil:[
			alreadyCalculated := singleImplementor.	
		]	
	].
	
	^alreadyCalculated