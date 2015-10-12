tests
testInheritance
	| classInfo methodInfo |
	self inferClass: J2ParentClass.
	classInfo := self inferClass: J2ChildClass.
	methodInfo := classInfo methodTypeFor: J2ChildClass >> #aMethod.
	self assert: methodInfo returnType hasType: {SmallInteger} onContext: { classInfo }