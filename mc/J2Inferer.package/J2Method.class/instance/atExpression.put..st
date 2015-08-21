expressions
atExpression: anExpression put: aTypeVariable
	self innerExpressions at: anExpression infererSource put: aTypeVariable