variables
returnOfMethod: aMethodSelector
	| buildUpName |
	buildUpName := aMethodSelector , '.^'.
	^ self variableNamed: buildUpName.