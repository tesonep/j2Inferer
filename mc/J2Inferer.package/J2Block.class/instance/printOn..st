printing
printOn: aStream
	aStream
		nextPutAll: 'a J2Block (';
		nextPutAll: index printString;
		nextPut: $)