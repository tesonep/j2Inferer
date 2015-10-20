comparing
= anotherArrayLiteral
	anotherArrayLiteral ifNil:[ ^ false].
	(anotherArrayLiteral isKindOf: J2ArrayLiteral ) ifFalse: [ ^false ].
	^ elements = anotherArrayLiteral elements.