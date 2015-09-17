accessing
minClassesInContext: aContext alreadyEvaluated: alreadyEvaluated
	| singleImplementor r |
	(alreadyEvaluated includesKey: {self. aContext asSet})
		ifTrue: [ 
			^ alreadyEvaluated at:{self. aContext asSet}
		].
	alreadyEvaluated at: {self. aContext asSet} put:#().
	r := self filter: (self generateMinClassesInContext: aContext alreadyEvaluated: alreadyEvaluated) byMessages: self selectors .
	
	r ifEmpty: [ 
		singleImplementor := self inferer singleImplementorOf: selectors.
		singleImplementor ifNotNil:[
			r := singleImplementor.	
		]	
	].
	
	alreadyEvaluated at: {self. aContext asSet} put:r.
	
	^r