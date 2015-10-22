methods
fillSuperclass
	self analysedClass superclass ifNotNil: [ 
		superclass := self inferer typeInfoFor: self analysedClass superclass.	
	]