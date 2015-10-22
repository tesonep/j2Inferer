accessing
method: anObject
	| classContainer |
	
	method := anObject.
	
	classContainer := J2ClassBasedContainer new
		classVariable: method classTypeInfo;
		yourself.
		
	self
		pushContainer:
			(J2MethodBasedContainer new
				element: method;
				parent: classContainer;
				yourself)