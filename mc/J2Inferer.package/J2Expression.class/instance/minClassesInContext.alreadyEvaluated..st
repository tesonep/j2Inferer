accessing
minClassesInContext: aContext alreadyEvaluated: alreadyEvaluated
	| singleImplementor  |
	(alreadyEvaluated includes: self)
		ifTrue: [ 
			^ alreadyCalculated ifNil:#().
		].
	alreadyEvaluated add: self.
	alreadyCalculated := self filter: (self generateMinClassesInContext: aContext alreadyEvaluated: alreadyEvaluated) byMessages: self selectors .
	
	alreadyCalculated ifEmpty: [ 
		singleImplementor := self inferer singleImplementorOf: selectors.
		singleImplementor ifNotNil:[
			alreadyCalculated := singleImplementor.	
		]	
	].
	
	^alreadyCalculated