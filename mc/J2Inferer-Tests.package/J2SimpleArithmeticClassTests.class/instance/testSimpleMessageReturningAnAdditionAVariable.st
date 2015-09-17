tests
testSimpleMessageReturningAnAdditionAVariable
	| methodInfo classInfo |			
	classInfo := self inferClass: J2SimpleArithmeticClass.
	methodInfo := classInfo
		methodTypeFor: J2SimpleArithmeticClass >> #simpleMessageReturningAnAdditionAVariable.
	self assert: methodInfo returnType hasType: Number allSubclasses.
	self assert: (classInfo instanceVariable: #aVariable) hasType: {SmallInteger} 