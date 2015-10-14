scripts
deserializeFromFile: aFileName
	| aStream materializer | 
	aStream := GZipReadStream on: (FileStream fileNamed: aFileName). 
	materializer := FLMaterializer newDefault.
	
	inferer := (materializer materializeFrom: aStream) root.
		
	aStream close.
	
	^ inferer.
	