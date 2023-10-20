Class {
	#name : #J2MessageChainingTest,
	#superclass : #J2AbstractTests,
	#category : 'J2Inferer-Tests'
}

{ #category : #tests }
J2MessageChainingTest >> testMessageCascade [
	| classInfo methodContainer varExpression methodVariable |
	classInfo := self inferClass: J2MessageChaining.
	methodVariable := inferer methodVariableFor: J2MessageChaining >> #aThirdMessage.
	methodContainer := self containerFor: methodVariable.

	varExpression := methodContainer atExpression: (RBVariableNode named:#aLocal).
	
	self assertCollection:(varExpression selectors) equals:#(odd even + * floor) asSet.
	
]

{ #category : #tests }
J2MessageChainingTest >> testMessageChaining [
	| classInfo methodContainer msgExpression varNode msgNode varExpression methodInfo |
	classInfo := self inferClass: J2MessageChaining.
	methodInfo := classInfo methodTypeFor: J2MessageChaining >> #anotherMessage:.
	methodContainer := self containerFor: methodInfo.

	varNode := RBVariableNode named:'x'.
	msgNode := RBMessageNode receiver: varNode selector: #aMessage. 
	varExpression := methodContainer atExpression: varNode.
	msgExpression := methodContainer atExpression: msgNode.
	
	self assert:msgExpression isNotNil.
	self assertCollection:((classInfo instanceVariable: #aValue) possibleClassesInContext:(J2Context with:{classInfo})) classes  equals: #() asSet.
	self assertCollection:(varExpression allSelectors: {classInfo}) equals:#(#aMessage) asSet.
	
]
