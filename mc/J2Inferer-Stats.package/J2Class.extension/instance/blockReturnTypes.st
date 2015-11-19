*J2Inferer-Stats
blockReturnTypes
	^ self methods count: [ :v | v returnValue isBlockOn:{self} ]