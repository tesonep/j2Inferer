accessing
selectAllMethods:aBlock
	^ self selfAndSuperclasses flatCollect: [ :e | e methods select:aBlock ]