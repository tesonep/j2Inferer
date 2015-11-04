tests
testInheritance
	| classInfo |
	self inferClass: J2ParentClass.
	classInfo := self inferClass: J2ChildClass.
	self assert: (classInfo returnOfMethod: J2ChildClass >> #aMethod) hasType: {SmallInteger} onContext: { classInfo }