tests
testSimpleParameterPassing
	| classInfo methodInfo |
	classInfo := self inferClass: J2SimpleParameters.
	methodInfo := classInfo methodTypeFor: J2SimpleParameters >> #aVariable.
	
	self assert: (classInfo instanceVariable: #aVariable) hasType: {SmallInteger}.
	self assert: methodInfo returnType hasType: {SmallInteger}