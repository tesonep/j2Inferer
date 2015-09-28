checks
checkDefaultReturnExpression
	| selfExpr |
	self element returnType hasNoSubtypes
		ifTrue:
			[ selfExpr := innerExpressions
				at: 'self'
				ifAbsentPut: [ J2Self new
						container: self element;
						inferer: inferer;
						yourself ].
			self element returnType addSubtype: selfExpr ]