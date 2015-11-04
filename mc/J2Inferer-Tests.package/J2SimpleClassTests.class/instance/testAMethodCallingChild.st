tests
testAMethodCallingChild
	| classInfo |
	self inferClass: J2ParentClass.
	classInfo := self inferClass: J2ChildClass.
	self assert: (classInfo instanceVariable: #aParentVariable) hasType: {SmallInteger} onContext:{classInfo}.
	self assert: (classInfo returnOfMethod: J2ParentClass >> #aMethodCallingChild ) hasType: {SmallInteger} onContext:{classInfo}.