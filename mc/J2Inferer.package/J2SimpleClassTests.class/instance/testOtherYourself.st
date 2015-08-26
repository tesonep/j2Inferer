tests
testOtherYourself
	| classInfo methodInfo |
	classInfo := self inferClass: J2SimpleClass.
	methodInfo := classInfo methodTypeFor: J2SimpleClass >> #otherYourself.
	
	self assert: (methodInfo temporaryVariableFor:#y) hasType: {Dictionary}.
	self assert: methodInfo returnType hasType: {Dictionary}