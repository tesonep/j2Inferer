accessing
maxClasses
	^ messages ifEmpty: nil
					ifNotEmpty: [ 
							self filterByMessages: self allClasses.
						 ]