accessing
elements
	^ elements
		ifNil:
			[ elements := J2Variable new
				variableName: 'elements';
				yourself ]