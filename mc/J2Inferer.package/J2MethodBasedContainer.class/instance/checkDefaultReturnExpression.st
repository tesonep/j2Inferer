checks
checkDefaultReturnExpression
	| selfExpr |
	self element returnType hasNoSubtypes
		ifTrue:
			[ selfExpr := innerExpressions
				at: 'self'
				ifAbsentPut: [ inferer selfVariable ].
			self element returnType addSubtype: selfExpr ]