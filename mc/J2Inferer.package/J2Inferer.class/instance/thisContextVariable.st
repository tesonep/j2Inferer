single instance variables
thisContextVariable
	^ thisContextVariable ifNil: [ thisContextVariable := J2ThisContext new. ].