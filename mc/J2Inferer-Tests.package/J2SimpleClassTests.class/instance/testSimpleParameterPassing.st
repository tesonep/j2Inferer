tests
testSimpleParameterPassing
	| classInfo |
	classInfo := self inferClass: J2SimpleParameters.
	
	self assert: (classInfo instanceVariable: #aVariable) hasType: {SmallInteger} onContext:{classInfo}.
	self assert: (classInfo returnOfMethod: J2SimpleParameters >> #aVariable ) hasType: {SmallInteger} onContext:{classInfo}.