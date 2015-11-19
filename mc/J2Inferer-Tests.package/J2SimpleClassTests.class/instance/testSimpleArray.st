tests
testSimpleArray
	| classInfo methodInfo |
	classInfo := self inferClass: J2SimpleClass.
	methodInfo := classInfo methodTypeFor: J2SimpleClass >> #simpleArray.
	self assert: methodInfo returnValue hasType: {Array} onContext:{classInfo}.
	self
		assert: methodInfo returnValue elements
		hasType:
			{SmallInteger.
			ByteSymbol}
		onContext:{classInfo}