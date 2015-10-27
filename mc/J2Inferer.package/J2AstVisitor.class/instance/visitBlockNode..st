visiting
visitBlockNode: aBlockNode
	| blk |
	numberOfBlocks := numberOfBlocks + 1.
	
	blk := J2Block new
		index: numberOfBlocks;
		fillReturn;
		fillParameters: aBlockNode;
		yourself.
		
	self container atExpression: aBlockNode ifAbsentPut: blk.

	self
		pushContainer:
			(J2BlockBasedContainer new
				element: blk;
				parent: self container;
				yourself).

	self visitArgumentNodes: aBlockNode arguments.

	self visitNode: aBlockNode body.
	
	(aBlockNode body statements isNotEmpty and:[ aBlockNode body statements last isReturn not]) 
	ifTrue:[
		blk returnType addSubtype: (self container atExpression: (aBlockNode body statements last))
	] ifFalse:[
		| nilNode |
		nilNode := RBLiteralValueNode value: 'nil'.
		self inferer addLiteralVariable: nilNode.
		blk returnType addSubtype: (self container atExpression: nilNode ) 
	].
	
	self popContainer