accessing
maxClassesInContext: aContext
   | allSelectors |
   allSelectors := self allSelectors: aContext.
	^ allSelectors 
		ifEmpty: #()
		ifNotEmpty: [ 
			self inferer implementorsRegistry implementorsOfAll: allSelectors.
		]