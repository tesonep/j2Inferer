tests
testClassSideVariable
	| classInfo methodInfo metaClassInfo |
	classInfo := self inferClass: J2SimpleClassSide.
	metaClassInfo := self inferClass: J2SimpleClassSide class.
	
	methodInfo := classInfo methodTypeFor: J2SimpleClassSide >> #anAccessor.
	
	self assert: (metaClassInfo instanceVariable: #aClassVariable) hasType: {SmallInteger} onContext: {metaClassInfo}.
	self assert: methodInfo returnType hasType: {SmallInteger} onContext: { classInfo }.