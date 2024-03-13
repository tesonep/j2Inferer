Class {
	#name : #J2SimpleClassTests,
	#superclass : #J2AbstractTests,
	#category : #'J2Inferer-Tests'
}

{ #category : #tests }
J2SimpleClassTests >> testAMethodCallingChild [
	| classInfo methodInfo |
	self inferClass: J2ParentClass.
	classInfo := self inferClass: J2ChildClass.
	methodInfo := classInfo methodTypeFor: J2ParentClass >> #aMethodCallingChild.
	self assert: (classInfo instanceVariable: #aParentVariable) hasType: {SmallInteger} onContext:{classInfo}.
	self assert: methodInfo returnValue hasType: {SmallInteger} onContext:{classInfo}.
]

{ #category : #tests }
J2SimpleClassTests >> testInheritance [
	| classInfo methodInfo |
	self inferClass: J2ParentClass.
	classInfo := self inferClass: J2ChildClass.
	methodInfo := classInfo methodTypeFor: J2ChildClass >> #aMethod.
	self assert: methodInfo returnValue hasType: {SmallInteger} onContext: { classInfo }
]

{ #category : #tests }
J2SimpleClassTests >> testObjectCreation [
	| classInfo |
	classInfo := self inferClass: J2ChildClass.
	self inferMethod: Behavior >> #new.
	self inferMethod: ProtoObject >> #initialize.
	
	self assert: (classInfo instanceVariable: #anotherClass) hasType: {J2SimpleClass class} onContext:{classInfo}. 
	self assert: (classInfo instanceVariable: #anotherObject) hasType: {J2SimpleClass} onContext:{classInfo}.

]

{ #category : #tests }
J2SimpleClassTests >> testOtherYourself [
	| classInfo methodInfo methodContainer |
	"In the image there is 3 implementors of #yourself"
	inferer config maxNumberImplementorsToOpen: 3.
	
	classInfo := self inferClass: J2SimpleClass.

	self inferMethod: HashedCollection class>>#new.
	self inferMethod: HashedCollection >> #initialize:.
	
	methodInfo := classInfo methodTypeFor: J2SimpleClass >> #otherYourself.
	methodContainer := self containerFor:methodInfo.
	
	self assert: (methodContainer temporaryVariables at:#y) hasType: {Dictionary} onContext:{classInfo}.
	self assert: methodInfo returnValue hasType: {Dictionary} onContext:{classInfo}
]

{ #category : #tests }
J2SimpleClassTests >> testRecursiveMethod [
	| classInfo methodInfo |
	classInfo := self inferClass: J2SimpleClass.
	methodInfo := classInfo methodTypeFor: J2SimpleClass >> #recursiveMethod:.
	self assert: methodInfo returnValue hasType: {ByteSymbol} onContext:{classInfo}.
]

{ #category : #tests }
J2SimpleClassTests >> testSelfInInheritance [
	| classInfo methodInfo |
	self inferClass: J2ParentClass.
	self inferMethod: Object >> #yourself.
	classInfo := self inferClass: J2ChildClass.
		
	methodInfo := classInfo methodTypeFor: Object >> #yourself.
	self assert: methodInfo returnValue hasType: {J2ChildClass} onContext: { classInfo }.
]

{ #category : #tests }
J2SimpleClassTests >> testSetValueToAInstanceVariable [
	| classInfo methodInfo |
	classInfo := self inferClass: J2SimpleClass.
	methodInfo := classInfo methodTypeFor: J2SimpleClass >> #simpleSendingAMessage.
	self assert: methodInfo returnValue hasType: {SmallInteger} onContext:{classInfo}
]

{ #category : #tests }
J2SimpleClassTests >> testSimpleArray [
	| classInfo methodInfo |
	classInfo := self inferClass: J2SimpleClass.
	methodInfo := classInfo methodTypeFor: J2SimpleClass >> #simpleArray.
	self assert: methodInfo returnValue hasType: {Array} onContext:{classInfo}.
	self
		assert: methodInfo returnValue elements
		hasType:
			{SmallInteger.
			ByteSymbol}
		onContext:{classInfo}
]

{ #category : #tests }
J2SimpleClassTests >> testSimpleArrayLiteral [
	| classInfo methodInfo |
	classInfo := self inferClass: J2SimpleClass.
	methodInfo := classInfo methodTypeFor: J2SimpleClass >> #simpleArrayLiteral.
	self assert: methodInfo returnValue hasType: {Array} onContext:{classInfo}.
	self assert: methodInfo returnValue elements hasType: {SmallInteger . ByteSymbol} onContext:{classInfo}
]

{ #category : #tests }
J2SimpleClassTests >> testSimpleMethodReturningAValue [
	| methodInfo |
	methodInfo := self inferMethod: J2SimpleClass >> #simpleMethodReturningAValue.
	self assert: methodInfo hasTemporaryVariable: #a.
	self assert: methodInfo returnValue hasType: {SmallInteger} onContext:(self contextFor: {J2SimpleClass})
]

{ #category : #tests }
J2SimpleClassTests >> testSimpleParameterPassing [
	| classInfo methodInfo |
	classInfo := self inferClass: J2SimpleParameters.
	methodInfo := classInfo methodTypeFor: J2SimpleParameters >> #aVariable.
	
	self assert: (classInfo instanceVariable: #aVariable) hasType: {SmallInteger} onContext:{classInfo}.
	self assert: methodInfo returnValue hasType: {SmallInteger} onContext:{classInfo}.
]

{ #category : #tests }
J2SimpleClassTests >> testSimpleSendingAMessage [
	| classInfo methodInfo |
	classInfo := self inferClass: J2SimpleClass.
	methodInfo := classInfo methodTypeFor: J2SimpleClass >> #simpleSendingAMessage.
	
	self assert: (classInfo instanceVariable: #aVariable) hasType: {SmallInteger} onContext:{classInfo}.
	self assert: methodInfo returnValue hasType: {SmallInteger} onContext:{classInfo}.
]
