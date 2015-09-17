tests
testSetValueToAInstanceVariable
	| classInfo methodInfo |
	classInfo := self inferClass: J2SimpleClass.
	methodInfo := classInfo methodTypeFor: J2SimpleClass >> #simpleSendingAMessage.
	self assert: methodInfo returnType hasType: {SmallInteger}