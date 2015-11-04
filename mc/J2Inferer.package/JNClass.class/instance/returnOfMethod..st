variables
returnOfMethod: aMethod
	| buildUpName |
	buildUpName := aMethod selector , '.^'.
	^ self variableNamed: buildUpName.