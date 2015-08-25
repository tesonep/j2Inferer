as yet unclassified
testAMethodCallingChild
	| classInfo methodInfo |
	self inferClass: J2ParentClass.
	classInfo := self inferClass: J2ChildClass.
	methodInfo := classInfo methodTypeFor: J2ParentClass >> #aMethodCallingChild.
	self assert: (classInfo instanceVariable: #aParentVariable) hasType: {SmallInteger}.
	self assert: methodInfo returnType hasType: {SmallInteger}