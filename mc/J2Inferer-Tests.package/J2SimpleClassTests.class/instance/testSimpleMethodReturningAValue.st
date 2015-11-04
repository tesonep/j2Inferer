tests
testSimpleMethodReturningAValue
	| classInfo |
	classInfo := self inferClass: J2SimpleClass.
	self assert: (classInfo returnOfMethod: J2SimpleClass >> #simpleMethodReturningAValue) hasType: {SmallInteger} onContext:(self contextFor: {J2SimpleClass})