tests
testSimpleMessageReturningAnAddition
	| methodInfo classInfo |
	classInfo := self inferClass: J2SimpleArithmeticClass.
	methodInfo := classInfo methodTypeFor: J2SimpleArithmeticClass >> #simpleMessageReturningAnAddition.
	self assert: methodInfo returnValue hasType: Number allSubclasses onContext:{ classInfo }.