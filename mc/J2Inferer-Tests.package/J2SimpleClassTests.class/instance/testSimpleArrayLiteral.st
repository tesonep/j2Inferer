tests
testSimpleArrayLiteral
	| classInfo methodInfo |
	classInfo := self inferClass: J2SimpleClass.
	methodInfo := classInfo methodTypeFor: J2SimpleClass >> #simpleArrayLiteral.
	self assert: methodInfo returnValue hasType: {Array} onContext:{classInfo}.
	self assert: methodInfo returnValue elements hasType: {SmallInteger . ByteSymbol} onContext:{classInfo}