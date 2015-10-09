accessing
printOn: aStream
	aStream
		nextPutAll: 'a J2Array (';
"		nextPutAll: elements printString; 
		nextPutAll: ' @ ';
"		nextPutAll: self container printString;
		nextPut: $)