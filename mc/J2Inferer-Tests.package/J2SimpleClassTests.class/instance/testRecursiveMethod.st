tests
testRecursiveMethod
	| classInfo |
	classInfo := self inferClass: J2SimpleClass.
	self assert: (classInfo returnOfMethod: J2SimpleClass >> #recursiveMethod:) hasType: {ByteSymbol} onContext:{classInfo}.