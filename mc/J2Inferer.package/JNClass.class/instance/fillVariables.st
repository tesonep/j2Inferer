initialization
fillVariables
	| vars |
	vars := self analysedClass instanceVariables.
	vars ifNotNil: [ vars do: [ :v | self addVariable: v asSymbol ] ].
	self analysedClass classVariablesString
		ifNotEmpty: [ (self analysedClass classVariablesString splitOn: ' ') do: [ :v | self addVariable: v ] ]