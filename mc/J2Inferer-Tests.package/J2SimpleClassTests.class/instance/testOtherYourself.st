tests
testOtherYourself
	| classInfo methodInfo |
	classInfo := self inferClass: J2SimpleClass.

	self inferMethod: HashedCollection class>>#new.
	self inferMethod: HashedCollection >> #initialize:.
	
	methodInfo := classInfo methodTypeFor: J2SimpleClass >> #otherYourself.
	
	self assert: (methodInfo temporaryVariableFor:#y) hasType: {Dictionary}.
	self assert: methodInfo returnType hasType: {Dictionary}