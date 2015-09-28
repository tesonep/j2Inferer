accessing
printOn: aStream
	aStream
		nextPutAll: 'a J2Array (';
		nextPutAll: expression printString; 
		nextPutAll: ' @ ';
		nextPutAll: self container printString;
		nextPut: $)