printing
printOn: aStream
	super printOn: aStream.
	aStream nextPut: $(.
	elements types printOn: aStream.
	aStream nextPut: $).