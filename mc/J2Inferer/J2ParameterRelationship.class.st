"
These objects represents the relationship between a parameter and the argument passed in the message.
"
Class {
	#name : #J2ParameterRelationship,
	#superclass : #Object,
	#instVars : [
		'expression',
		'isMeta'
	],
	#category : 'J2Inferer-Variables'
}

{ #category : #'instance creation' }
J2ParameterRelationship class >> for: anExpression isMeta: isMeta [
	^ self new
		expression: anExpression;
		isMeta: isMeta;
		yourself
]

{ #category : #subtyping }
J2ParameterRelationship >> addSupertype: aVariable [ 
	expression addSupertype: aVariable.
]

{ #category : #'minimal types' }
J2ParameterRelationship >> blocksOn: aContext alreadyEvaluated: alreadyEvaluated [
	"I have to change the context if is the meta class the receiver"

	| newContext |
	newContext := isMeta
		ifTrue: [ (aContext collect: #metaClass) asSet ]
		ifFalse: [ aContext ].
	^ expression blocksOn: aContext alreadyEvaluated: alreadyEvaluated
]

{ #category : #accessing }
J2ParameterRelationship >> expression [
	^ expression
]

{ #category : #accessing }
J2ParameterRelationship >> expression: anObject [
	expression := anObject
]

{ #category : #'minimal types' }
J2ParameterRelationship >> isBlockOn: aContext alreadyEvaluated: alreadyEvaluated [
	"I have to change the context if is the meta class the receiver"

	| newContext |
	newContext := isMeta
		ifTrue: [ (aContext collect: #metaClass) asSet ]
		ifFalse: [ aContext ].
	^ expression isBlockOn: aContext alreadyEvaluated: alreadyEvaluated
]

{ #category : #accessing }
J2ParameterRelationship >> isMeta [
	^ isMeta
]

{ #category : #accessing }
J2ParameterRelationship >> isMeta: anObject [
	isMeta := anObject
]

{ #category : #'minimal types' }
J2ParameterRelationship >> minClassesInContext: aContext alreadyEvaluated: alreadyEvaluated [
	"I have to change the context if is the meta class the receiver"
	| newContext |
	newContext := isMeta ifTrue:[ aContext metaClassContext ] ifFalse:[ aContext].
	^ expression minClassesInContext: newContext alreadyEvaluated: alreadyEvaluated.
]
