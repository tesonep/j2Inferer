tests
testMessageChaining
	| classInfo parameter variable |
	classInfo := self inferClass: J2MessageChaining.
	parameter := classInfo variableNamed: #x inMethod: J2MessageChaining >> #anotherMessage:.
	variable := classInfo instanceVariable: #aValue.

	self assertCollection: (variable possibleClasses: (J2Context with: {classInfo})) equals: #().
	self assertCollection: (parameter allSelectors: (J2Context with: {classInfo})) equals: #(#aMessage) asSet