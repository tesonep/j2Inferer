computing types
maxClassesInContext: aContext
   | allSelectors |
   allSelectors := self allSelectors: aContext.
	^ (allSelectors 
		ifEmpty: #()
		ifNotEmpty: [ 
			aContext inferer implementorsRegistry implementorsOfAll: allSelectors.
		]) collect:[ :e | aContext inferer typeInfoFor: e ].