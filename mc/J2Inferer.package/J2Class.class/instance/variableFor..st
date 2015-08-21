accessing
variableFor: aName
	^ self variableFor: aName ifAbsent: [ inferer variableFor: aName ]