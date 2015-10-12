accessing
printOn: aStream
	aStream
		nextPutAll: 'a J2Array (';
		nextPutAll: elements printString; 
		nextPut: $)