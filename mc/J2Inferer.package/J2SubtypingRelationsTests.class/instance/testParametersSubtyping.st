as yet unclassified
testParametersSubtyping
	| classInfo aVariable methodInfo otherMethod aParameter messageExpression aParameterVariable |
	classInfo := self inferClass: J2SubtypingTestClass.
	methodInfo := classInfo methodTypeFor: J2SubtypingTestClass >> #senderMessage .
	otherMethod := classInfo methodTypeFor: J2SubtypingTestClass >> #sentMessage: .
	
	"self sentMessage: passedByParameter."
	messageExpression := methodInfo atExpression: (RBMessageNode receiver: (RBSelfNode named:'self') selector:#sentMessage:  arguments:{(RBVariableNode named:'passedByParameter')} ).	
	aParameterVariable := messageExpression parameters at:1.
	
	aVariable := methodInfo atExpression: (RBTemporaryNode named:#passedByParameter).
	aParameter := otherMethod atExpression: (RBVariableNode named:#aParameter).

	self assertCollection: (aVariable allMessages collect:#selector) equals: #(aMessageToParameter) asSet.
	self assertCollection: (aVariable subtypes) equals: #() asSet.
	self assertCollection: (aVariable supertypes) equals: { aParameterVariable. aParameter } asSet.

	"As the sender and the method is in the same class or hierarchy is ok to have this strong relationship."
	
	self assertCollection: (aParameter allMessages collect:#selector) equals: #(aMessageToParameter) asSet.
	self assertCollection: (aParameter subtypes) equals: {aVariable} asSet.
	self assertCollection: (aParameter supertypes) equals: #() asSet.