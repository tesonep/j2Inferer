tests
testSimpleArrayLiteral
	| classInfo |
	classInfo := self inferClass: J2SimpleClass.
	self assert: (classInfo returnOfMethod: J2SimpleClass >> #simpleArrayLiteral) hasType: {Array} onContext:{classInfo}.
	self assert: (classInfo returnOfMethod: J2SimpleClass >> #simpleArrayLiteral) elements hasType: {SmallInteger . ByteSymbol} onContext:{classInfo}