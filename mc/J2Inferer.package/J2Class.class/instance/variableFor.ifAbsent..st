accessing
variableFor: aNode ifAbsent: aValuable
	| aName |
	aName := aNode name asSymbol .
	^ self instanceVariables at: aName ifAbsent: [ 
		superclass ifNil:aValuable
			ifNotNil:[
				superclass variableFor: aNode ifAbsent:aValuable.
			].
	]