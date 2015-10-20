applying
returnTypeFor: message onContext: aContext
	| blocks |
	blocks := message receiver blocksOn: aContext.
	^ blocks flatCollect: [ :e | e returnType minClassesInContext: aContext ].