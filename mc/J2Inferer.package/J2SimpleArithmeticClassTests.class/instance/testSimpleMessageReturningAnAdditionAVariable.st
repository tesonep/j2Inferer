as yet unclassified
testSimpleMessageReturningAnAdditionAVariable
	| methodInfo classInfo |			
	classInfo := self inferClass: J2SimpleArithmeticClass.
	methodInfo := classInfo
		methodTypeFor: J2SimpleArithmeticClass >> #simpleMessageReturningAnAdditionAVariable.
	self assert: methodInfo returnType hasType: {SmallInteger}.
	self assert: (classInfo instanceVariable: #aVariable) hasType: {SmallInteger}