"
This is the abstract parent of all the containers that can have inside expressions and subexpressions. 
"
Class {
	#name : #J2ExpressionContainer,
	#superclass : #J2AbstractContainer,
	#instVars : [
		'parent',
		'innerExpressions',
		'temporaryVariables',
		'element'
	],
	#category : #'J2Inferer-AST'
}

{ #category : #messages }
J2ExpressionContainer >> addMessageSentTo: aMessage [
	| rcvr msg |
	rcvr := self atExpression: aMessage receiver.
	msg := J2Message
		addMessageSent: aMessage
		container: self
		inferer: self inferer
		receiver: rcvr
		parameters: (aMessage arguments collect: [ :e | self atExpression: e ]).
	self atExpression: aMessage ifAbsentPut:  msg.
]

{ #category : #accessing }
J2ExpressionContainer >> atExpression: aNode [

	^ self subclassResponsibility
]

{ #category : #accessing }
J2ExpressionContainer >> atExpression: aNode ifAbsentPut: aBlock [

	^ self subclassResponsibility
]

{ #category : #accessing }
J2ExpressionContainer >> element [
	^ element
]

{ #category : #accessing }
J2ExpressionContainer >> element: anObject [
	element := anObject
]

{ #category : #variables }
J2ExpressionContainer >> hasTemporaryVariable: aName [
	^ temporaryVariables includesKey: aName
]

{ #category : #initialization }
J2ExpressionContainer >> initialize [
	super initialize.
	temporaryVariables := Dictionary new.
	innerExpressions := Dictionary new
]

{ #category : #accessing }
J2ExpressionContainer >> innerExpressions [
	^ innerExpressions
]

{ #category : #accessing }
J2ExpressionContainer >> innerExpressions: anObject [
	innerExpressions := anObject
]

{ #category : #testing }
J2ExpressionContainer >> isMethodContext [
	^ false
]

{ #category : #accessing }
J2ExpressionContainer >> parent [
	^ parent
]

{ #category : #accessing }
J2ExpressionContainer >> parent: anObject [
	parent := anObject
]

{ #category : #accessing }
J2ExpressionContainer >> temporaryVariables [
	^ temporaryVariables
]

{ #category : #accessing }
J2ExpressionContainer >> temporaryVariables: anObject [
	temporaryVariables := anObject
]

{ #category : #variables }
J2ExpressionContainer >> variableFor: aNode [
	| aName |
	aName := aNode infererSource.
	^ element parameterFor: aName
		ifAbsent:
			[ temporaryVariables at: aName asSymbol ifAbsent: [ parent variableFor: aNode ] ]
]
