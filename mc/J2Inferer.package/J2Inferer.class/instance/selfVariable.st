single instance variables
selfVariable
	^ selfVariable ifNil: [ selfVariable := J2Self new. ].