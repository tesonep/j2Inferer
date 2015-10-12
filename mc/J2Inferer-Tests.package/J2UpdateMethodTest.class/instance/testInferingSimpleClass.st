as yet unclassified
testInferingSimpleClass
	| mockClass classInfo methodInfo methodInfo2 |
	mockClass:= classFactory silentlyNewSubclassOf: Object instanceVariableNames:''  classVariableNames: ''.
	mockClass compile: '
	returnsAValue
		^ 73.
	'.
	
	classInfo := self inferClass: mockClass.
	methodInfo := inferer methodVariableFor: mockClass >> #returnsAValue.
	
	self assert: methodInfo returnType  hasType: {SmallInteger}  onContext: {classInfo}..
	methodInfo forceUpdate. 

	mockClass compile: '
	returnsAValue
		^ ''Hello''.
	'.
	
	self inferMethod: mockClass >> #returnsAValue.
	methodInfo2 := inferer methodVariableFor: mockClass >> #returnsAValue.
	
	self assert: methodInfo = methodInfo2.
	self assert: methodInfo returnType  hasType: { ByteString }  onContext:{classInfo}.