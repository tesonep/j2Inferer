initialization
printOn: aStream
	aStream
		nextPutAll: 'a J2Class (';
		nextPutAll: self name; nextPut: $)