tests
testSimpleMessageReturningAnAddition
	| classInfo |
	classInfo := self inferClass: J2SimpleArithmeticClass.
	self
		assert: (classInfo returnOfMethod: J2SimpleArithmeticClass >> #simpleMessageReturningAnAddition)
		hasType: Number allSubclasses
		onContext: {classInfo}