scripts
serializeToFile: aFileName
	| aStream  serializer | 
	aStream := GZipWriteStream on: (File named: aFileName) writeStream. 
	serializer := FLSerializer newDefault.
	serializer stream: aStream.
	serializer serialize: J2Inferer instance.
	aStream close.