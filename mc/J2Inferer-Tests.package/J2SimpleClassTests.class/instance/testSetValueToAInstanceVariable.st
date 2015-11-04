tests
testSetValueToAInstanceVariable
	| classInfo |
	classInfo := self inferClass: J2SimpleClass.
	self assert: (classInfo returnOfMethod: J2SimpleClass >> #simpleSendingAMessage) hasType: {SmallInteger} onContext:{classInfo}