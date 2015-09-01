as yet unclassified
testParametersSubtyping
	| classInfo aVariable methodInfo otherMethod aParameter|
	classInfo := self inferClass: J2SubtypingTestClass.
	methodInfo := classInfo methodTypeFor: J2SubtypingTestClass >> #senderMessage .
	otherMethod := classInfo methodTypeFor: J2SubtypingTestClass >> #sentMessage: .
	
	aVariable := methodInfo atExpression: (RBTemporaryNode named:#passedByParameter).
	aParameter := otherMethod atExpression: (RBVariableNode named:#aParameter).

	self assertCollection: (aVariable allMessages collect:#selector) equals: #(aMessageToParameter) asSet.
	self assertCollection: (aVariable subtypes) equals: #() asSet.
	self assertCollection: (aVariable supertypes) equals: { aParameter } asSet.

	"As the sender and the method is in the same class or hierarchy is ok to have this strong relationship."
	
	self assertCollection: (aParameter allMessages collect:#selector) equals: #(aMessageToParameter) asSet.
	self assertCollection: (aParameter subtypes) equals: {aVariable} asSet.
	self assertCollection: (aParameter supertypes) equals: #() asSet.