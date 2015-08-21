visiting
visitBlockNode: aBlockNode
	| blk |
	blk := J2Block new
		expression: aBlockNode infererSource;
		inferer: inferer;
		container: self container;
		yourself.
	self container atExpression: aBlockNode put: blk.
	self pushContainer: blk.
	self visitArgumentNodes: aBlockNode arguments.
	self visitNode: aBlockNode body.
	self popContainer