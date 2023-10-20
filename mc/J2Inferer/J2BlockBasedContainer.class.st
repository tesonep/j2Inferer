"
This container represents the context generated in a block.
"
Class {
	#name : #J2BlockBasedContainer,
	#superclass : #J2ExpressionContainer,
	#category : 'J2Inferer-AST'
}

{ #category : #'return type' }
J2BlockBasedContainer >> addReturnSubtype: anExpression [
	self parent addReturnSubtype: anExpression.
]

{ #category : #variables }
J2BlockBasedContainer >> addTemporaryVariableFor: aNode [
	| aName |
	aName := aNode infererSource.
	^ (self hasTemporaryVariable: aName)
		ifTrue: [ self variableFor: aNode ]
		ifFalse:
			[ 
				^ temporaryVariables
				at: aName asSymbol
				put:
					((J2Variable newOnClass: self containerClass )
						variableName: aName asSymbol;
						yourself) ]
]

{ #category : #expressions }
J2BlockBasedContainer >> atExpression: aNode [
	^ element
		parameterFor: aNode infererSource
		ifAbsent:
			[ temporaryVariables at: aNode infererSource ifAbsent: [ parent atExpression: aNode ] ]
]

{ #category : #expressions }
J2BlockBasedContainer >> atExpression: aNode ifAbsentPut: aBlock [  
	parent atExpression: aNode ifAbsentPut: aBlock.
]

{ #category : #container }
J2BlockBasedContainer >> containerClass [
	^ self parent containerClass
]

{ #category : #variables }
J2BlockBasedContainer >> hasTemporaryVariable: aName [
	^ (super hasTemporaryVariable: aName) or:[ parent hasTemporaryVariable: aName].
]
