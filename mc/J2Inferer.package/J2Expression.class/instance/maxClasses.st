accessing
maxClasses
   | allSelectors |
   allSelectors := self allSelectors.
	^ allSelectors 
		ifEmpty: nil
		ifNotEmpty: [ 
			self inferer implementorsOfAll: allSelectors.
		]