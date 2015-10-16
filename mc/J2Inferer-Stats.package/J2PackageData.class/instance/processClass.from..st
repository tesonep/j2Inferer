as yet unclassified
processClass: cls from: inferer
	| type |
	type := inferer typeInfoFor: cls.

	totalVariables := totalVariables + type instanceVariables size.
	withDataVariables := withDataVariables + type instanceVariablesWithData.
	blockVariables := blockVariables + type blockInstanceVariables.

"	totalMethods := totalMethods + type methods size.
	withDataReturn := withDataReturn + type returnTypesWithData.
	blockReturnTypes := blockReturnTypes + type blockReturnTypes.
	
	type methods 
		ifNotEmpty: 
			[totalParameters := totalParameters + (type methods sum:[:m | m parameters size]).]"