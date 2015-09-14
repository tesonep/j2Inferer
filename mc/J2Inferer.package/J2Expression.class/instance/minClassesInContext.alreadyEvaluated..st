accessing
minClassesInContext: aContext alreadyEvaluated: alreadyEvaluated
	| singleImplementor  allMessages |
	(alreadyEvaluated includes: self)
		ifTrue: [ 
			^ alreadyCalculated ifNil:#().
		].
	alreadyEvaluated add: self.
	alreadyCalculated := self filter: (self generateMinClassesInContext: aContext alreadyEvaluated: alreadyEvaluated) byMessages: self messages .
	
	alreadyCalculated ifEmpty: [ 
		allMessages := self allMessages: IdentitySet new onContext: aContext.
		singleImplementor := self inferer singleImplementorOf: allMessages.
		singleImplementor ifNotNil:[
			alreadyCalculated := singleImplementor.	
		]	
	].
	
	^alreadyCalculated