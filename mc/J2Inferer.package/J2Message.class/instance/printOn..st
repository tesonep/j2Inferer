as yet unclassified
printOn: aStream
	aStream
		nextPutAll: 'a J2Message (';
		nextPutAll: self receiver printString;
		nextPutAll: ' ';
		nextPutAll: self selector printString;
		nextPut: $)