tests
testAMethodCallingChild
	| classInfo methodInfo |
	self inferClass: J2ParentClass.
	classInfo := self inferClass: J2ChildClass.
	methodInfo := classInfo methodTypeFor: J2ParentClass >> #aMethodCallingChild.
	self assert: (classInfo instanceVariable: #aParentVariable) hasType: {SmallInteger} onContext:{classInfo}.
	self assert: methodInfo returnValue hasType: {SmallInteger} onContext:{classInfo}.