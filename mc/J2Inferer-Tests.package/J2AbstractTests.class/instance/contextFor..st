infering
contextFor: aBunchOfClasses
	^aBunchOfClasses collect:[ :each | inferer typeInfoFor: each]