checks
checkDefaultReturnExpression
	| selfExpr |
	self element returnValue hasNoSubtypes
		ifTrue:
			[ selfExpr := innerExpressions
				at: 'self'
				ifAbsentPut: [ self inferer selfVariable ].
			self element returnValue addSubtype: selfExpr ]