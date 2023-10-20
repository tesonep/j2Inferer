"
This container represents the context used in a method.
"
Class {
	#name : #J2MethodBasedContainer,
	#superclass : #J2ExpressionContainer,
	#category : 'J2Inferer-AST'
}

{ #category : #'return type' }
J2MethodBasedContainer >> addReturnSubtype: anExpression [
	self element addReturnSubtype: anExpression.
]

{ #category : #variables }
J2MethodBasedContainer >> addTemporaryVariableFor: aNode [
	| aName |
	aName := aNode infererSource.
	^ temporaryVariables
		at: aName asSymbol
		ifAbsentPut: [ 
			(J2Variable newOnClass: self containerClass)
				variableName: aName asSymbol;
				yourself ]
]

{ #category : #expressions }
J2MethodBasedContainer >> atExpression: anExpression [
	^ self innerExpressions
		at: anExpression infererSource
		ifAbsent: [ self variableFor: anExpression ]
]

{ #category : #expressions }
J2MethodBasedContainer >> atExpression: anExpression ifAbsentPut: aBlock [
	self innerExpressions at: anExpression infererSource ifAbsentPut: aBlock
]

{ #category : #checks }
J2MethodBasedContainer >> checkDefaultReturnExpression [
	| selfExpr |
	self element returnValue hasNoSubtypes
		ifTrue:
			[ selfExpr := innerExpressions
				at: 'self'
				ifAbsentPut: [ self inferer selfVariable ].
			self element returnValue addSubtype: selfExpr ]
]

{ #category : #container }
J2MethodBasedContainer >> containerClass [
	^ self element classTypeInfo
]

{ #category : #testing }
J2MethodBasedContainer >> isMethodContext [
	^ true
]
