implementors-queries
implementorsRegistry
	implementors
		ifNil: [ 
			implementors := J2ImplementorsRegistry new.
			implementors fill ].
	^ implementors