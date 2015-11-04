tests
testMessageCascade
	| classInfo variable |
	classInfo := self inferClass: J2MessageChaining.
	variable := classInfo variableNamed: #aLocal inMethod: J2MessageChaining >> #aThirdMessage.
	
	self assertCollection:(variable selectors) equals:#(odd even + * floor) asSet.
	