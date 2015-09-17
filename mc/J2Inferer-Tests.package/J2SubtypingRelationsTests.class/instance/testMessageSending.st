tests
testMessageSending
	| classInfo  aVariable methodInfo messageExpression otherMethod |
	classInfo := self inferClass: J2SubtypingTestClass.
	methodInfo := classInfo methodTypeFor: J2SubtypingTestClass >> #storingReturnedValue .
	otherMethod := classInfo methodTypeFor: J2SubtypingTestClass >> #assigningAValue .
	
	aVariable := methodInfo atExpression: (RBTemporaryNode named:#aLocal).
	messageExpression := methodInfo atExpression: (RBMessageNode receiver: (RBSelfNode named:'self') selector: #assigningAValue ).

	self assertCollection: aVariable subtypes equals: {messageExpression} asSet.
	self assertCollection: (aVariable allSelectors) equals: #() asSet.
	self assertCollection: messageExpression supertypes equals: #() asSet.
	self assertCollection: messageExpression methods equals: {otherMethod} asSet.

