accessing
method: anObject
	| classContainer |
	
	method := anObject.
	
	classContainer := J2ClassBasedContainer new
		classVariable: method classTypeInfo;
		inferer: inferer;
		yourself.
		
	self
		pushContainer:
			(J2MethodBasedContainer new
				element: method;
				parent: classContainer;
				inferer: inferer;
				yourself)