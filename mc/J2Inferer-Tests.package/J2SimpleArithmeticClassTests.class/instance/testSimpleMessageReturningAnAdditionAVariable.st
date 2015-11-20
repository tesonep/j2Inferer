tests
testSimpleMessageReturningAnAdditionAVariable
	| methodInfo classInfo |			
	classInfo := self inferClass: J2SimpleArithmeticClass.
	methodInfo := classInfo methodTypeFor: J2SimpleArithmeticClass >> #simpleMessageReturningAnAdditionAVariable.
	
	self assert: methodInfo returnValue hasType: {Number} onContext:{classInfo}.
	self assert: (classInfo instanceVariable: #aVariable) hasType: {SmallInteger} onContext: {classInfo}