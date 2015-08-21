creating globals
addLiteralVariable: aLiteralNode
	literals at:aLiteralNode infererSource ifAbsentPut:[
			J2Literal new literalValue: aLiteralNode value; inferer:self ;yourself.
		]