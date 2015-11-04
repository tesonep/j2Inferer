tests
testSimpleMessageReturningAnAdditionAVariable
	| classInfo |
	classInfo := self inferClass: J2SimpleArithmeticClass.
	self
		assert: (classInfo returnOfMethod: J2SimpleArithmeticClass >> #simpleMessageReturningAnAdditionAVariable)
		hasType: Number allSubclasses
		onContext: {classInfo}.
	self
		assert: (classInfo instanceVariable: #aVariable)
		hasType: {SmallInteger}
		onContext: {classInfo}