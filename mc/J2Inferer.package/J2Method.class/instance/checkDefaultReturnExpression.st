as yet unclassified
checkDefaultReturnExpression
	| selfExpr |
	self returnType hasNoSubtypes
		ifTrue:
			[ 
			selfExpr := innerExpressions at: 'self' ifAbsentPut: [ J2Self new container:self;inferer:inferer;yourself ].
			self returnType addSubtype: selfExpr ]