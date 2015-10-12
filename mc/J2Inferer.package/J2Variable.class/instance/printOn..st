printing
printOn: aStream
	aStream
		nextPutAll: 'a J2Variable (';
		nextPutAll: self name; 
		nextPut: $)