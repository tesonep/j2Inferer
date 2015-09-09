as yet unclassified
knownObjectMessages
	^ knownObjectMessages ifNil: [ knownObjectMessages := Object allMethods collect: #selector ]