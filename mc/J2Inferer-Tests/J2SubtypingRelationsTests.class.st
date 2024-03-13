Class {
	#name : #J2SubtypingRelationsTests,
	#superclass : #J2AbstractTests,
	#category : #'J2Inferer-Tests'
}

{ #category : #adapting }
J2SubtypingRelationsTests >> rbArgumentNode [

	^ Smalltalk at: #RBArgumentNode ifAbsent: [ RBVariableNode ]
]

{ #category : #adapting }
J2SubtypingRelationsTests >> rbSelfNode [

	^ Smalltalk at: #RBSelfNode ifAbsent: [ ^ RBVariableNode ]
]

{ #category : #adapting }
J2SubtypingRelationsTests >> rbTemporaryNode [

	^ Smalltalk at: #RBTemporaryNode ifAbsent: [ ^ RBVariableNode ]
]

{ #category : #running }
J2SubtypingRelationsTests >> runCaseManaged [
	^ self runCase
]

{ #category : #tests }
J2SubtypingRelationsTests >> testAsignation [
	| classInfo  aVariable anotherVariable |
	classInfo := self inferClass: J2SubtypingTestClass.
	aVariable := classInfo instanceVariable: #aVariable.
	anotherVariable := classInfo instanceVariable: #anotherVariable.
	
	self assertCollection: aVariable subtypes equals: {anotherVariable} asSet.
	self assertCollection: anotherVariable supertypes equals: {aVariable} asSet.

]

{ #category : #tests }
J2SubtypingRelationsTests >> testLiterals [

	| classInfo aVariable methodInfo aLiteralExpression methodContainer |
	classInfo := self inferClass: J2SubtypingTestClass.
	methodInfo := classInfo methodTypeFor:
		              J2SubtypingTestClass >> #assigningALiteral.
	methodContainer := self containerFor: methodInfo.

	aVariable := methodContainer atExpression:
		             (self rbTemporaryNode named: #aLocal).
	aLiteralExpression := methodContainer atExpression:
		                      (RBLiteralNode value: 23).

	self
		assertCollection: aVariable subtypes
		equals: { aLiteralExpression } asSet
]

{ #category : #tests }
J2SubtypingRelationsTests >> testMessageSending [

	| classInfo aVariable methodInfo messageExpression otherMethod methodContext |
	classInfo := self inferClass: J2SubtypingTestClass.
	methodInfo := classInfo methodTypeFor:
		              J2SubtypingTestClass >> #storingReturnedValue.
	otherMethod := classInfo methodTypeFor:
		               J2SubtypingTestClass >> #assigningAValue.

	methodContext := self containerFor: methodInfo.

	aVariable := methodContext atExpression:
		             (self rbTemporaryNode named: #aLocal).
	messageExpression := methodContext atExpression: (RBMessageNode
			                      receiver: (self rbSelfNode named: 'self')
			                      selector: #assigningAValue).

	self
		assertCollection: aVariable subtypes
		equals: { messageExpression } asSet.
	self
		assertCollection: (aVariable allSelectors: { classInfo })
		equals: #(  ) asSet.
	self
		assertCollection: messageExpression supertypes
		equals: #(  ) asSet.
	self
		assertCollection: (messageExpression methodsOn: { classInfo })
		equals: { otherMethod }
]

{ #category : #tests }
J2SubtypingRelationsTests >> testParametersSubtyping [

	| classInfo aVariable methodInfo otherMethod aParameter messageExpression aParameterVariable methodContainer otherMethodContainer |
	classInfo := self inferClass: J2SubtypingTestClass.
	methodInfo := classInfo methodTypeFor:
		              J2SubtypingTestClass >> #senderMessage.
	otherMethod := classInfo methodTypeFor:
		               J2SubtypingTestClass >> #sentMessage:.
	methodContainer := self containerFor: methodInfo.
	otherMethodContainer := self containerFor: otherMethod.

	"self sentMessage: passedByParameter."
	messageExpression := methodContainer atExpression: (RBMessageNode
			                      receiver: (self rbSelfNode named: 'self')
			                      selector: #sentMessage:
			                      arguments:
			                      { (self rbTemporaryNode named:
				                       'passedByParameter') }).
	aParameterVariable := messageExpression parameters at: 1.

	aVariable := methodContainer atExpression:
		             (RBVariableNode named: #passedByParameter).
	aParameter := otherMethodContainer atExpression:
		              (RBVariableNode named: #aParameter).

	self
		assertCollection:
		(aVariable allSelectors: (J2Context with: { classInfo }))
		equals: #( aMessageToParameter ) asSet.
	self assertCollection: aVariable subtypes equals: #(  ) asSet.
	self assertCollection: aVariable supertypes equals: {
			aParameterVariable.
			aParameter } asSet.

	"As the sender and the method is in the same class or hierarchy is ok to have this strong relationship."

	self
		assertCollection: (aParameter allSelectors: { classInfo })
		equals: #( aMessageToParameter ) asSet.
	self
		assertCollection: (aParameter subtypes collect: #expression)
		equals: { aVariable } asSet.
	self assertCollection: aParameter supertypes equals: #(  ) asSet
]

{ #category : #tests }
J2SubtypingRelationsTests >> testParametersSubtypingOutsideHierarchy [

	| classInfo aVariable aParameter anotherClassInfo methodInfo anotherMethodInfo methodExpression aParameterVariable anotherMethodContainer methodContainer |
	self inferAllParentsAndMetas: {
			J2SimpleParametersOutsideHierarchy.
			J2SimpleMessageOutsideHierarchy }.
	classInfo := self infoOfClass: J2SimpleParametersOutsideHierarchy.
	anotherClassInfo := self infoOfClass: J2SimpleMessageOutsideHierarchy.
	methodInfo := anotherClassInfo methodTypeFor:
		              J2SimpleMessageOutsideHierarchy >> #aMessage:.
	methodContainer := self containerFor: methodInfo.

	anotherMethodInfo := classInfo methodTypeFor:
		                     J2SimpleParametersOutsideHierarchy
		                     >> #simpleMessage.
	anotherMethodContainer := self containerFor: anotherMethodInfo.

	"aLocal aMessage: aValue."
	methodExpression := anotherMethodContainer atExpression:
		                    (RBMessageNode
			                     receiver: (RBVariableNode named: 'aLocal')
			                     selector: #aMessage:
			                     arguments:
			                     { (RBVariableNode named: 'aValue') }).
	aParameterVariable := methodExpression parameters at: 1.

	aVariable := classInfo instanceVariable: #aValue.
	aParameter := methodContainer atExpression:
		              (self rbArgumentNode named: #anObject).

	self
		assertCollection: (aVariable allSelectors: { classInfo })
		equals: #( aMessageToParameter ) asSet.
	self assertCollection: aVariable subtypes equals: #(  ) asSet.
	self
		assertCollection: aVariable supertypes
		equals: { aParameterVariable } asSet.

	"As the sender and the method is not in the same class or hierarchy is not ok to have this strong relationship."

	self
		assertCollection: (aParameter allSelectors: { anotherClassInfo })
		equals: #( aMessageToParameter ) asSet.
	self assertCollection: aParameter subtypes equals: #(  ) asSet.
	self assertCollection: aParameter supertypes equals: #(  ) asSet
]
