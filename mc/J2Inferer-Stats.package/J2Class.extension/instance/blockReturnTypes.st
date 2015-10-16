*J2Inferer-Stats
blockReturnTypes
	^ self methods count: [ :v | v returnType isBlockOn:{self} ]