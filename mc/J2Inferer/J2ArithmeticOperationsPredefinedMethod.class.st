"
Special behavior for the arithmetic operations.

If you are operating 2 Numbers it will return other Number. 
It can be improved to handle special cases like, if one of the operands is a float the result will be float.
"
Class {
	#name : #J2ArithmeticOperationsPredefinedMethod,
	#superclass : #J2AbstractPredefinedMethod,
	#instVars : [
		'parameters'
	],
	#category : 'J2Inferer-PredefinedMethods'
}

{ #category : #initialization }
J2ArithmeticOperationsPredefinedMethod >> config [
	implementingClasses := Number allSubclasses collect: [ :e | inferer typeInfoFor: e ].
	parametersTypes := {implementingClasses}.
	selectors := #(#+ #* #- #/ #//).
	parameters := {((J2Variable newOnClass: ( inferer typeInfoFor: Number))
		variableName: 'parameter1';
		yourself)}
]

{ #category : #'as yet unclassified' }
J2ArithmeticOperationsPredefinedMethod >> parameters [
	^ parameters
]

{ #category : #initialization }
J2ArithmeticOperationsPredefinedMethod >> remainingContextFor: aMessage onContext: aContext [
	^ J2Context with: (aContext contents difference: implementingClasses)
]

{ #category : #'as yet unclassified' }
J2ArithmeticOperationsPredefinedMethod >> returnTypeFor: message onContext: receiverContext alreadyEvaluated: alreadyEvaluated [
	^ J2Type withClasses: implementingClasses 
]
