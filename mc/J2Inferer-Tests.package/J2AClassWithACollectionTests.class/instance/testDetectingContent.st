tests
testDetectingContent
	| classInfo varInfo methodInfo |
	self skip.
	self inferAllParentsAndMetas: { J2AClassWithACollection. Bag. J2UsingAClassWithACollection }.
	
	classInfo := self infoOfClass: J2UsingAClassWithACollection.
	varInfo := classInfo instanceVariable: #anObject.
	methodInfo := classInfo methodTypeFor:  J2UsingAClassWithACollection >> #any.
	
	self assert: varInfo hasType: {J2AClassWithACollection} onContext: {classInfo}.
	self assert: methodInfo returnType hasType: {SmallInteger} onContext: {classInfo}