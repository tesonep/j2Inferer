tests
testMessageSending
	| classInfo  aVariable methodInfo messageExpression otherMethod methodContext |
	classInfo := self inferClass: J2SubtypingTestClass.
	methodInfo := classInfo methodTypeFor: J2SubtypingTestClass >> #storingReturnedValue .
	otherMethod := classInfo methodTypeFor: J2SubtypingTestClass >> #assigningAValue .

	methodContext := self containerFor: methodInfo.
	
	aVariable := methodContext atExpression: (RBTemporaryNode named:#aLocal).
	messageExpression := methodContext atExpression: (RBMessageNode receiver: (RBSelfNode named:'self') selector: #assigningAValue ).

	self assertCollection: aVariable subtypes equals: {messageExpression} asSet.
	self assertCollection: (aVariable allSelectors:{classInfo}) equals: #() asSet.
	self assertCollection: messageExpression supertypes equals: #() asSet.
	self assertCollection: (messageExpression methodsOn:{classInfo}) equals: {otherMethod}.

