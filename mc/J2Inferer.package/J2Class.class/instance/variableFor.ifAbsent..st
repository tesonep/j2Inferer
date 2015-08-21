accessing
variableFor: aName ifAbsent: aValuable.
	^ instanceVariables at: aName ifAbsent: [ 
		superclass ifNil:aValuable
			ifNotNil:[
				superclass variableFor: aName ifAbsent:aValuable.
			].
	]