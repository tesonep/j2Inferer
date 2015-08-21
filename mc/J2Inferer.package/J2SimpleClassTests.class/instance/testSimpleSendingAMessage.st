as yet unclassified
testSimpleSendingAMessage
	| classInfo methodInfo |
	classInfo := self inferClass: J2SimpleClass.
	methodInfo := classInfo methodTypeFor: J2SimpleClass >> #simpleSendingAMessage.
	
	self assert: (classInfo variableFor: #aVariable) hasType: {SmallInteger}.
	self assert: methodInfo returnType hasType: {SmallInteger}