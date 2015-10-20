tests
testSimpleMethodReturningAValue
	| methodInfo |
	methodInfo := self inferMethod: J2SimpleClass >> #simpleMethodReturningAValue.
	self assert: methodInfo hasTemporaryVariable: #a.
	self assert: methodInfo returnType hasType: {SmallInteger} onContext:(self contextFor: {J2SimpleClass})