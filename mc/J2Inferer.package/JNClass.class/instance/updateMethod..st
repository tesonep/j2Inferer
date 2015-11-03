generating data
updateMethod: aMethod
	| astNode |
	astNode := aMethod ast.
	self addVariable: aMethod selector , '.^'.