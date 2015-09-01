as yet unclassified
testMessageCascade
	| classInfo methodInfo varExpression|
	classInfo := self inferClass: J2MessageChaining.
	methodInfo := classInfo methodTypeFor: J2MessageChaining >> #aThirdMessage.

	varExpression := methodInfo atExpression: (RBVariableNode named:#aLocal).
	
	self assertCollection:(varExpression messages collect:#selector) equals:#(odd even + * floor) asSet.
	