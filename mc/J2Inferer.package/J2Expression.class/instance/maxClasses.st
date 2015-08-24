accessing
maxClasses
   | allMessages |
   allMessages := self allMessages.
	^ allMessages 
		ifEmpty: nil
		ifNotEmpty: [ 
			self filter: self allClasses byMessages: allMessages.
		]