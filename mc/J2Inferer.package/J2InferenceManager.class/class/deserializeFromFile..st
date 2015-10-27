scripts
deserializeFromFile: aFileName
	| aStream materializer | 
	aStream := GZipReadStream on: (FileStream fileNamed: aFileName). 
	materializer := FLMaterializer newDefault.
	
	J2Inferer instance: (materializer materializeFrom: aStream) root.
		
	aStream close.
	
	^ J2Inferer instance.
	