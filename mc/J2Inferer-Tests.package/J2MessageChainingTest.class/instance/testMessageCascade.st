tests
testMessageCascade
	| classInfo methodInfo varExpression|
	classInfo := self inferClass: J2MessageChaining.
	methodInfo := classInfo methodTypeFor: J2MessageChaining >> #aThirdMessage.

	varExpression := methodInfo atExpression: (RBVariableNode named:#aLocal).
	
	self assertCollection:(varExpression selectors) equals:#(odd even + * floor) asSet.
	