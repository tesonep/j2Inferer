accessing
variableFor: aName
	^ self variableFor: aName ifAbsent: [ inferer variableFor: aName ifAbsent:[ self undefinedVariable: aName ] ]