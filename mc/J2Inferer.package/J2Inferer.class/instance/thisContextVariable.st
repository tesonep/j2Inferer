single instance variables
thisContextVariable
	^ thisContextVariable
		ifNil:
			[ thisContextVariable := J2ThisContext new
				type: (self typeInfoFor: Context);
				yourself ]