creating globals
addLiteralVariable: aLiteralNode
	^literals at:aLiteralNode value class ifAbsentPut:[
			J2Literal new literalClass: (self typeInfoFor: aLiteralNode value class); 
			yourself.
		]