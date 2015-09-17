tests
testObjectCreation
	| classInfo |
	classInfo := self inferClass: J2ChildClass.
	self inferMethod: Behavior >> #new.
	self inferMethod: ProtoObject >> #initialize.
	
	self assert: (classInfo instanceVariable: #anotherClass) hasType: {J2SimpleClass class}. 
	self assert: (classInfo instanceVariable: #anotherObject) hasType: {J2SimpleClass}.
