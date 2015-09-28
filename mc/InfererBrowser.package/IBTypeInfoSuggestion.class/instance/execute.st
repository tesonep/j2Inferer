as yet unclassified
execute
	| inferer node methodNode methodVariable typeVariable | 
	
	inferer := J2Scripts inferer.
	node := context selectedNode.
	methodNode := node methodNode.
	methodVariable := inferer methodVariableFor: methodNode method.
	typeVariable := methodVariable atExpression: node.
	
	IBBrowser openOn: typeVariable asIBModel.