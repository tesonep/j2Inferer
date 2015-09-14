as yet unclassified
testMessageChaining
	| classInfo methodInfo msgExpression varNode msgNode varExpression|
	classInfo := self inferClass: J2MessageChaining.
	methodInfo := classInfo methodTypeFor: J2MessageChaining >> #anotherMessage:.

	varNode := RBVariableNode named:'x'.
	msgNode := RBMessageNode receiver: varNode selector: #aMessage. 
	varExpression := methodInfo atExpression: varNode.
	msgExpression := methodInfo atExpression: msgNode.
	
	self assert:msgExpression isNotNil.
	self assert:(classInfo instanceVariable: #aValue) possibleClasses isNil.
	self assertCollection:(varExpression allSelectors) equals:#(#aMessage) asSet.
	