visiting
visitInstanceVariableNode: aNode
	^ JNLocalReference named: aNode name asSymbol.