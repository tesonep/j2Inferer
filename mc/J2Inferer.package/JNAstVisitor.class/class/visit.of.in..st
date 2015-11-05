visiting
visit: astNode of: aMethod in: aClass.
	^ self basicNew
				method: aMethod;
				analysedClass: aClass;
				initialize;
				visitNode: astNode.