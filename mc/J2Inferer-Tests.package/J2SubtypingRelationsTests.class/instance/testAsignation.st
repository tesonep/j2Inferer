tests
testAsignation
	| classInfo  aVariable anotherVariable |
	classInfo := self inferClass: J2SubtypingTestClass.
	aVariable := classInfo instanceVariable: #aVariable.
	anotherVariable := classInfo instanceVariable: #anotherVariable.
	
	self assertCollection: aVariable subtypes equals: {anotherVariable} asSet.
	self assertCollection: anotherVariable supertypes equals: {aVariable} asSet.
