tests
testObjectCreation
	| classInfo |
	classInfo := self inferClass: J2ChildClass.
	self
		assert: (classInfo instanceVariable: #anotherClass)
		hasType: {J2SimpleClass class}. self
		assert: (classInfo instanceVariable: #anotherObject)
		hasType: {J2SimpleClass}