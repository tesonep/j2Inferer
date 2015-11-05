tests
testClassSideVariable
	| classInfo metaClassInfo |
	classInfo := self inferClass: J2SimpleClassSide.
	metaClassInfo := self inferClass: J2SimpleClassSide class.
	
	self assert: (metaClassInfo instanceVariable: #aClassVariable) hasType: {SmallInteger} onContext: {metaClassInfo}.
	self assert: (classInfo returnOfMethod:J2SimpleClassSide >> #anAccessor) hasType: {SmallInteger} onContext: { classInfo }.