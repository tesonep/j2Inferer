printing
printOn: aStream
	aStream
		nextPutAll: 'a J2Variable (';
		nextPutAll: self name; 
		nextPutAll: ' @ ';
		nextPutAll: self container printString;
		nextPut: $)