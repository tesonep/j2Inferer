expressions
atExpression: anExpression
	^ self innerExpressions
		at: anExpression infererSource
		ifAbsent: [ self variableFor: anExpression infererSource ]