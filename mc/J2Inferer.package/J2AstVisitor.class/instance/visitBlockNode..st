visiting
visitBlockNode: aBlockNode
	| blk |
	blk := J2Block new
		inferer: inferer;
		container: self container;
		fillParameters: aBlockNode;
		yourself.
	self container atExpression: aBlockNode put: blk.
	self pushContainer: blk.
	self visitArgumentNodes: aBlockNode arguments.
	self visitNode: aBlockNode body.
	self popContainer