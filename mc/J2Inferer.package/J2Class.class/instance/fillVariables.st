variables
fillVariables
	| variables |
	variables := analysedClass instanceVariables.
	variables ifNotNil: [ variables do: [ :v | self addVariableFor: v ] ].
	analysedClass classVariablesString
		ifNotEmpty: [ (analysedClass classVariablesString splitOn:' ') do: [ :v | self addVariableFor: v ] ]