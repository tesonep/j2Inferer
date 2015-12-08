as yet unclassified
index: anIndex blockNode: aBlockNode onClass: aClass
	^ self basicNew
		container: aClass;
		index: anIndex;
		fillReturn;
		fillParameters: aBlockNode;
		relateParametersToSelf;
		yourself