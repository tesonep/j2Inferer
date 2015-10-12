as yet unclassified
execute
	| inferer node methodNode methodVariable typeVariable | 
	
	inferer := J2InferenceManager inferer.
	node := context selectedNode.
	methodNode := node methodNode.
	methodVariable := inferer methodVariableFor: methodNode method.
	methodVariable forceUpdate.
	
	inferer registerASTContainerListener: self.
	inferer inferMethod: methodVariable method.
	inferer registerASTContainerListener: self.
	
	typeVariable := astContext atExpression: node.
	
	IBBrowser openOn: (typeVariable asIBModel: {methodVariable classTypeInfo}).