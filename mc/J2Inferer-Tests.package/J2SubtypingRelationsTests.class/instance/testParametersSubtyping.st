tests
testParametersSubtyping
	|classInfo aVariable methodInfo otherMethod aParameter messageExpression aParameterVariable 
		methodContainer otherMethodContainer |
	classInfo := self inferClass: J2SubtypingTestClass.
	methodInfo := classInfo methodTypeFor: J2SubtypingTestClass >> #senderMessage .
	otherMethod := classInfo methodTypeFor: J2SubtypingTestClass >> #sentMessage: .
	methodContainer := self containerFor:methodInfo.
	otherMethodContainer := self containerFor: otherMethod.
	
	"self sentMessage: passedByParameter."
	messageExpression := methodContainer atExpression: (RBMessageNode receiver: (RBSelfNode named:'self') selector:#sentMessage:  arguments:{(RBVariableNode named:'passedByParameter')} ).	
	aParameterVariable := messageExpression parameters at:1.
	
	aVariable := methodContainer atExpression: (RBTemporaryNode named:#passedByParameter).
	aParameter := otherMethodContainer atExpression: (RBVariableNode named:#aParameter).

	self assertCollection: (aVariable allSelectors: {classInfo}) equals: #(aMessageToParameter) asSet.
	self assertCollection: (aVariable subtypes) equals: #() asSet.
	self assertCollection: (aVariable supertypes) equals: { aParameterVariable. aParameter } asSet.

	"As the sender and the method is in the same class or hierarchy is ok to have this strong relationship."
	
	self assertCollection: (aParameter allSelectors: {classInfo}) equals: #(aMessageToParameter) asSet.
	self assertCollection: (aParameter subtypes collect:#expression) equals: {aVariable} asSet.
	self assertCollection: (aParameter supertypes) equals: #() asSet.