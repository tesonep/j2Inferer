printing
printOn: aStream
	super printOn: aStream.
	aStream nextPut: $(.
	contents ifNil: [ aStream nextPutAll: 'nil' ] ifNotNil: [ contents printOn: aStream ].
	aStream nextPut: $).