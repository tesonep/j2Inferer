checks
checkDefaultReturnExpression
	| selfExpr |
	self element returnType hasNoSubtypes
		ifTrue:
			[ selfExpr := innerExpressions
				at: 'self'
				ifAbsentPut: [ self inferer selfVariable ].
			self element returnType addSubtype: selfExpr ]