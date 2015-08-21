accessing
printOn: aStream
	aStream
		nextPutAll: 'a J2InheritedMethod (';
		nextPutAll: self name;
		nextPut: $)