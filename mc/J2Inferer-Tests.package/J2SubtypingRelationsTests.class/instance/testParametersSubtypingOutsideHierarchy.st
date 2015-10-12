tests
testParametersSubtypingOutsideHierarchy
	| classInfo aVariable   aParameter anotherClassInfo methodInfo anotherMethodInfo methodExpression aParameterVariable anotherMethodContainer methodContainer |
	classInfo := self inferClass: J2SimpleParametersOutsideHierarchy.
	anotherClassInfo := self inferClass: J2SimpleMessageOutsideHierarchy .
	methodInfo := anotherClassInfo methodTypeFor: J2SimpleMessageOutsideHierarchy >> #aMessage:.
	methodContainer := self containerFor: methodInfo.
	
	anotherMethodInfo := classInfo methodTypeFor: J2SimpleParametersOutsideHierarchy >> #simpleMessage.
	anotherMethodContainer := self containerFor: anotherMethodInfo.
	
	"aLocal aMessage: aValue."
	methodExpression := anotherMethodContainer atExpression: (RBMessageNode receiver: (RBVariableNode named:'aLocal') selector:#aMessage:  arguments:{(RBVariableNode named:'aValue')} ).	
	aParameterVariable := methodExpression parameters at:1.

	aVariable := classInfo instanceVariable: #aValue.
	aParameter := methodContainer atExpression: (RBArgumentNode named:#anObject).

	self assertCollection: (aVariable allSelectors: {classInfo}) equals: #(aMessageToParameter) asSet.
	self assertCollection: (aVariable subtypes) equals: #() asSet.
	self assertCollection: (aVariable supertypes) equals: { aParameterVariable } asSet.

	"As the sender and the method is not in the same class or hierarchy is not ok to have this strong relationship."

	self assertCollection: (aParameter allSelectors: {anotherClassInfo}) equals: #(aMessageToParameter) asSet.
	self assertCollection: (aParameter subtypes) equals: #() asSet.
	self assertCollection: (aParameter supertypes) equals: #() asSet.