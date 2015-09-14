as yet unclassified
knownObjectMessages
	^ knownObjectMessages ifNil: [ 
		knownObjectMessages := IdentitySet new:2048.
		knownObjectMessages addAll:(Class allMethods collect: #selector). ]