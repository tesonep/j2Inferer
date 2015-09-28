visiting
visitBlockNode: aBlockNode
	| blk |
	numberOfBlocks := numberOfBlocks + 1.
	
	blk := J2Block new
		inferer: inferer;
		index: numberOfBlocks;
		container: self container element;
		fillReturn;
		fillParameters: aBlockNode;
		yourself.
		
	self container atExpression: aBlockNode ifAbsentPut: blk.

	self
		pushContainer:
			(J2BlockBasedContainer new
				element: blk;
				parent: self container;
				inferer: inferer;
				yourself).

	self visitArgumentNodes: aBlockNode arguments.
	self visitNode: aBlockNode body.
	self popContainer