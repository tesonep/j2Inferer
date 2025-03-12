Class {
	#name : #J2SimpleArithmeticClassTests,
	#superclass : #J2AbstractTests,
	#category : 'J2Inferer-Tests'
}

{ #category : #tests }
J2SimpleArithmeticClassTests >> testSimpleMessageReturningAnAddition [
	| methodInfo classInfo |
	classInfo := self inferClass: J2SimpleArithmeticClass.
	methodInfo := classInfo methodTypeFor: J2SimpleArithmeticClass >> #simpleMessageReturningAnAddition.
	self assert: methodInfo returnValue hasType: {Number} onContext:{ classInfo }.
]

{ #category : #tests }
J2SimpleArithmeticClassTests >> testSimpleMessageReturningAnAdditionAVariable [
	| methodInfo classInfo |			
	classInfo := self inferClass: J2SimpleArithmeticClass.
	methodInfo := classInfo methodTypeFor: J2SimpleArithmeticClass >> #simpleMessageReturningAnAdditionAVariable.
	
	self assert: methodInfo returnValue hasType: {Number} onContext:{classInfo}.
	self assert: (classInfo instanceVariable: #aVariable) hasType: {SmallInteger} onContext: {classInfo}
]
