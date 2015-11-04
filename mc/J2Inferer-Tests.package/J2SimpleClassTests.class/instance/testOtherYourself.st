tests
testOtherYourself
	| classInfo |
	classInfo := self inferClass: J2SimpleClass.

	self inferMethod: HashedCollection class>>#new.
	self inferMethod: HashedCollection >> #initialize:.
		
	self assert: (classInfo variableNamed:#y inMethod: J2SimpleClass >> #otherYourself) hasType: {Dictionary} onContext:{classInfo}.
	self assert: (classInfo returnOfMethod: J2SimpleClass >> #otherYourself) hasType: {Dictionary} onContext:{classInfo}