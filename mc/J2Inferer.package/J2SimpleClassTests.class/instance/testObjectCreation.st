as yet unclassified
testObjectCreation
	| classInfo |
	classInfo := self inferClass: J2ChildClass.
	self
		assert: (classInfo variableFor: #anotherClass)
		hasType: {J2SimpleClass class}. self
		assert: (classInfo variableFor: #anotherObject)
		hasType: {J2SimpleClass}