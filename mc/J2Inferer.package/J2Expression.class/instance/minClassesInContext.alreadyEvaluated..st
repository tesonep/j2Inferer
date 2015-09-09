accessing
minClassesInContext: aContext alreadyEvaluated: alreadyEvaluated
	| singleImplementor |
	(alreadyEvaluated includes: self)
		ifTrue: [ 
			^ alreadyCalculated ifNil:#().
		].
	alreadyEvaluated add: self.
	alreadyCalculated := self filter: (self generateMinClassesInContext: aContext alreadyEvaluated: alreadyEvaluated) byMessages: self messages .
	
	alreadyCalculated ifEmpty: [ 
		singleImplementor := self inferer singleImplementorOf: messages.
		singleImplementor ifNotNil:[
			alreadyCalculated := singleImplementor.	
		]	
	].
	
	^alreadyCalculated