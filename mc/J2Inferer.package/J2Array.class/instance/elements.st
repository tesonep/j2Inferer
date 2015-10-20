accessing
elements
	^ elements
		ifNil:
			[ elements := J2Variable new
				inferer: inferer;
				variableName: 'elements';
				yourself ]