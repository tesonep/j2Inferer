tests
testOtherYourself
	| classInfo methodInfo methodContainer |
	classInfo := self inferClass: J2SimpleClass.

	self inferMethod: HashedCollection class>>#new.
	self inferMethod: HashedCollection >> #initialize:.
	
	methodInfo := classInfo methodTypeFor: J2SimpleClass >> #otherYourself.
	methodContainer := self containerFor:methodInfo.
	
	self assert: (methodContainer temporaryVariables at:#y) hasType: {Dictionary}.
	self assert: methodInfo returnType hasType: {Dictionary}