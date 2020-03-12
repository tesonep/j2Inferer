variables
fillVariables
	| variables |
	variables := self analysedClass instVarNames.
	variables ifNotNil: [ variables do: [ :v | self addVariableFor: v ] ].
	self analysedClass classVariablesString
		ifNotEmpty: [ (self analysedClass classVariablesString splitOn: ' ')
				do: [ :v | self addVariableFor: v ] ]