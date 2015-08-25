accessing
variableFor: aNode
	^ self
		variableFor: aNode
		ifAbsent:
			[ inferer variableFor: aNode ifAbsent: [ self undefinedVariable: aNode infererSource ] ]