accessing
visitLiteralArrayNode: aRBLiteralArrayNode
	self container
		atExpression: aRBLiteralArrayNode
		ifAbsentPut: [ self inferer arrayLiteral: aRBLiteralArrayNode ]