accesing type variables
arrayLiteral: aArrayLiteralNode
   | elements |
	elements := (aArrayLiteralNode contents collect:[:e | self typeInfoFor: e value class]) asSet asArray.
	literal := J2ArrayLiteral new.
	literal elementTypes: elements.
	literal typeInfo: (self typeInfoFor: Array).
	
	^ arrayLiterals like: literal ifAbsent:[
			arrayLiterals add: literal.
			literal.
		].
	