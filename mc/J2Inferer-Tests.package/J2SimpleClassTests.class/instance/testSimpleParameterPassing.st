tests
testSimpleParameterPassing
	| classInfo methodInfo |
	classInfo := self inferClass: J2SimpleParameters.
	methodInfo := classInfo methodTypeFor: J2SimpleParameters >> #aVariable.
	
	self assert: (classInfo instanceVariable: #aVariable) hasType: {SmallInteger} onContext:{classInfo}.
	self assert: methodInfo returnType hasType: {SmallInteger} onContext:{classInfo}.