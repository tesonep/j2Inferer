tests
testMessageChaining
	| classInfo methodContainer msgExpression varNode msgNode varExpression methodInfo |
	classInfo := self inferClass: J2MessageChaining.
	methodInfo := classInfo methodTypeFor: J2MessageChaining >> #anotherMessage:.
	methodContainer := self containerFor: methodInfo.

	varNode := RBVariableNode named:'x'.
	msgNode := RBMessageNode receiver: varNode selector: #aMessage. 
	varExpression := methodContainer atExpression: varNode.
	msgExpression := methodContainer atExpression: msgNode.
	
	self assert:msgExpression isNotNil.
	self assertCollection:(classInfo instanceVariable: #aValue) possibleClasses equals: #().
	self assertCollection:(varExpression allSelectors) equals:#(#aMessage) asSet.
	