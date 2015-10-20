*J2Inferer-Stats
blockInstanceVariables
	^ self instanceVariables
		count: [ :v | v isBlockOn: {self} ]