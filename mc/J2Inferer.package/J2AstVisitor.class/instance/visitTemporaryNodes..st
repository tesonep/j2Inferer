visiting
visitTemporaryNodes: aNodeCollection
	"This is triggered when defining the temporaries between the pipes"

	^ aNodeCollection do:[ :e | self visitTemporaryNode: e]