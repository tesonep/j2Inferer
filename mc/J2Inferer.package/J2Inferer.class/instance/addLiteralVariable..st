creating globals
addLiteralVariable: aLiteralNode
	^literals at:aLiteralNode value class ifAbsentPut:[
			J2Literal new literalClass: aLiteralNode value class; inferer:self ;yourself.
		]