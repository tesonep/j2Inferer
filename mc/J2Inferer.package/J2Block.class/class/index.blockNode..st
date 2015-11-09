as yet unclassified
index: anIndex blockNode: aBlockNode
	^ self basicNew
		index: anIndex;
		fillReturn;
		fillParameters: aBlockNode;
		relateParametersToSelf;
		yourself