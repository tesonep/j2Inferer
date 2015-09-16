accessing
maxClasses
   | allSelectors |
   allSelectors := self allSelectors.
	^ allSelectors 
		ifEmpty: nil
		ifNotEmpty: [ 
			self inferer implementorsRegistry implementorsOfAll: allSelectors.
		]