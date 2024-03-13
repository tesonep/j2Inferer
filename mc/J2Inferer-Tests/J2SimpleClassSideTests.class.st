Class {
	#name : #J2SimpleClassSideTests,
	#superclass : #J2AbstractTests,
	#category : 'J2Inferer-Tests'
}

{ #category : #tests }
J2SimpleClassSideTests >> testClassSideVariable [
	| classInfo methodInfo metaClassInfo |
	classInfo := self inferClass: J2SimpleClassSide.
	metaClassInfo := self inferClass: J2SimpleClassSide class.
	
	methodInfo := classInfo methodTypeFor: J2SimpleClassSide >> #anAccessor.
	
	self assert: (metaClassInfo instanceVariable: #aClassVariable) hasType: {SmallInteger} onContext: {metaClassInfo}.
	self assert: methodInfo returnValue hasType: {SmallInteger} onContext: { classInfo }.
]
