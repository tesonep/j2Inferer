as yet unclassified
testSimpleMessageReturningAnAddition
	| methodInfo classInfo |
	classInfo := self inferClass: J2SimpleArithmeticClass.
	methodInfo := classInfo
		methodTypeFor: J2SimpleArithmeticClass >> #simpleMessageReturningAnAddition.
	self assert: methodInfo returnType hasType: {SmallInteger}