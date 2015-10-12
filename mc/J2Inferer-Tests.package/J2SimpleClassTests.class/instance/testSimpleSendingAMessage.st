tests
testSimpleSendingAMessage
	| classInfo methodInfo |
	classInfo := self inferClass: J2SimpleClass.
	methodInfo := classInfo methodTypeFor: J2SimpleClass >> #simpleSendingAMessage.
	
	self assert: (classInfo instanceVariable: #aVariable) hasType: {SmallInteger} onContext:{classInfo}.
	self assert: methodInfo returnType hasType: {SmallInteger} onContext:{classInfo}.