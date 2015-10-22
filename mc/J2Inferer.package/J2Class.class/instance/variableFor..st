accessing
variableFor: aNode
	^ self
		variableFor: aNode
		ifAbsent:
			[ self inferer variableFor: aNode ifAbsent: [ self undefinedVariable: aNode infererSource ] ]