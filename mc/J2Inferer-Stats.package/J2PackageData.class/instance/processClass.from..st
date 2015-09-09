as yet unclassified
processClass: cls from: inferer
	| type |
	type := inferer typeInfoFor: cls.

	totalVariables := totalVariables + type instanceVariables size.
	withDataVariables := withDataVariables + type instanceVariablesWithData.

	totalMethods := totalMethods + type methods size.
	withDataReturn := withDataReturn + type returnTypesWithData.
	
	type methods 
		ifNotEmpty: 
			[totalParameters := totalParameters + (type methods sum:[:m | m parameters size]).]