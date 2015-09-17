tests
testLiterals
	| classInfo  aVariable methodInfo aLiteralExpression |
	classInfo := self inferClass: J2SubtypingTestClass.
	methodInfo := classInfo methodTypeFor: J2SubtypingTestClass >> #assigningALiteral .
	
	aVariable := methodInfo atExpression: (RBTemporaryNode named:#aLocal).
	aLiteralExpression := methodInfo atExpression: (RBLiteralNode value: 23).

	self assertCollection: aVariable subtypes equals: {aLiteralExpression} asSet.
	self assertCollection: aLiteralExpression supertypes equals: #() asSet.

