tests
testLiterals
	| classInfo  aVariable methodInfo aLiteralExpression methodContainer |
	classInfo := self inferClass: J2SubtypingTestClass.
	methodInfo := classInfo methodTypeFor: J2SubtypingTestClass >> #assigningALiteral .
	methodContainer := self containerFor: methodInfo.
	
	aVariable := methodContainer atExpression: (RBTemporaryNode named:#aLocal).
	aLiteralExpression := methodContainer atExpression: (RBLiteralNode value: 23).

	self assertCollection: aVariable subtypes equals: {aLiteralExpression} asSet.

