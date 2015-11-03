variables
variableNamed: aName inMethod: aMethod
	| buildUpName |
	buildUpName := aMethod selector , '.' , aName.
	^ self variableNamed: buildUpName.