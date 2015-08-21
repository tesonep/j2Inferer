accessing
printOn: aStream
	aStream
		nextPutAll: 'a J2Method (';
		nextPutAll: self name;
		nextPut: $)