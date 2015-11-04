as yet unclassified
testInferingSimpleClass
	| mockClass classInfo |
	mockClass := classFactory silentlyNewSubclassOf: Object instanceVariableNames: '' classVariableNames: ''.
	mockClass
		compile:
			'
	returnsAValue
		^ 73.
	'.
	classInfo := self inferClass: mockClass.
	self assert: (classInfo returnOfMethod: mockClass >> #returnsAValue) hasType: {SmallInteger} onContext: {classInfo}.
	mockClass
		compile:
			'
	returnsAValue
		^ ''Hello''.
	'.
	self inferMethod: mockClass >> #returnsAValue.
	self assert: (classInfo returnOfMethod: #returnsAValue) hasType: {ByteString} onContext: {classInfo}