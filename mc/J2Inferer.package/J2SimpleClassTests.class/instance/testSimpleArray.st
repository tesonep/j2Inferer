as yet unclassified
testSimpleArray
	| classInfo methodInfo |
	classInfo := self inferClass: J2SimpleClass.
	methodInfo := classInfo methodTypeFor: J2SimpleClass >> #simpleArray.
	self assert: methodInfo returnType hasType: {Array}.
	self
		assert: methodInfo returnType elements
		hasType:
			{SmallInteger.
			ByteSymbol}