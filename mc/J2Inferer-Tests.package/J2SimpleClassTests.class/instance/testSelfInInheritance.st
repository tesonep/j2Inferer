tests
testSelfInInheritance
	| classInfo |
	self inferClass: J2ParentClass.
	self inferMethod: Object >> #yourself.
	classInfo := self inferClass: J2ChildClass.		
	self assert: (classInfo returnOfMethod: Object >> #yourself) hasType: {J2ChildClass} onContext: { classInfo }.