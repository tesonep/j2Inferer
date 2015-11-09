accessing
analysedClass
	| baseName |
	^ (self name endsWith: ' class')
		ifTrue: [ baseName := (' ' split: self name) at:1.
			(Smalltalk at: baseName asSymbol) class ]
		ifFalse: [ Smalltalk at: self name ]