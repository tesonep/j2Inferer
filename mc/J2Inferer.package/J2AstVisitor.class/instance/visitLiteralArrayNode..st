accessing
visitLiteralArrayNode: aRBLiteralArrayNode
	self container
		atExpression: aRBLiteralArrayNode
		ifAbsentPut: [ inferer arrayLiteral: aRBLiteralArrayNode ]