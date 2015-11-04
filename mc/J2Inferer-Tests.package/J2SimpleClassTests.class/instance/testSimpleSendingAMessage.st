tests
testSimpleSendingAMessage
	| classInfo |
	classInfo := self inferClass: J2SimpleClass.
	
	self assert: (classInfo instanceVariable: #aVariable) hasType: {SmallInteger} onContext:{classInfo}.
	self assert: (classInfo returnOfMethod: J2SimpleClass >> #simpleSendingAMessage) methodInfo returnType hasType: {SmallInteger} onContext:{classInfo}.