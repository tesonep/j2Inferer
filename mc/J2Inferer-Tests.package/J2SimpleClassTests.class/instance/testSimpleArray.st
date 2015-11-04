tests
testSimpleArray
	| classInfo |
	classInfo := self inferClass: J2SimpleClass.
	self assert: (classInfo returnOfMethod: J2SimpleClass >> #simpleArray) hasType: {Array} onContext: {classInfo}.
	self
		assert: (classInfo returnOfMethod: J2SimpleClass >> #simpleArray) elements
		hasType:
			{SmallInteger.
			ByteSymbol}
		onContext: {classInfo}