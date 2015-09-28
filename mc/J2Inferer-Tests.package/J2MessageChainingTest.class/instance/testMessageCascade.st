tests
testMessageCascade
	| classInfo methodContainer varExpression methodVariable |
	classInfo := self inferClass: J2MessageChaining.
	methodVariable := inferer methodVariableFor: J2MessageChaining >> #aThirdMessage.
	methodContainer := self containerFor: methodVariable.

	varExpression := methodContainer atExpression: (RBVariableNode named:#aLocal).
	
	self assertCollection:(varExpression selectors) equals:#(odd even + * floor) asSet.
	