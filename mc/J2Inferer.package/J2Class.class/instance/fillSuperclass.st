methods
fillSuperclass
	self analysedClass superclass ifNotNil: [ 
		superclass := inferer typeInfoFor: self analysedClass superclass.	
	]