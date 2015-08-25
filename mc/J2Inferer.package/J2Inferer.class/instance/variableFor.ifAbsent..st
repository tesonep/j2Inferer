accesing type variables
variableFor: aNode ifAbsent: aValuable
	| aName |
	aName := aNode infererSource.
	^globals at:aName asSymbol ifAbsent:[literals at:aNode value class ifAbsent: aValuable].