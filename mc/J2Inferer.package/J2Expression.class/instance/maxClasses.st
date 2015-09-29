accessing
maxClasses
   | allSelectors |
   allSelectors := self allSelectors.
	^ allSelectors 
		ifEmpty: #()
		ifNotEmpty: [ 
			self inferer implementorsRegistry implementorsOfAll: allSelectors.
		]