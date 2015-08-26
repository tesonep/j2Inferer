tests
testRecursiveMethod
	| classInfo methodInfo |
	classInfo := self inferClass: J2SimpleClass.
	methodInfo := classInfo methodTypeFor: J2SimpleClass >> #recursiveMethod:.
	self assert: methodInfo returnType hasType: {ByteSymbol}