tests
testObjectCreation
	| classInfo |
	classInfo := self inferClass: J2ChildClass.
	self inferMethod: Behavior >> #new.
	self inferMethod: ProtoObject >> #initialize.
	
	self assert: (classInfo instanceVariable: #anotherClass) hasType: {J2SimpleClass class} onContext:{classInfo}. 
	self assert: (classInfo instanceVariable: #anotherObject) hasType: {J2SimpleClass} onContext:{classInfo}.
