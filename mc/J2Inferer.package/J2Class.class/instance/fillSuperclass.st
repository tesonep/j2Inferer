methods
fillSuperclass
	analysedClass superclass ifNotNil: [ 
		superclass := inferer typeInfoFor: analysedClass superclass.	
	]