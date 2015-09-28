variables
hasTemporaryVariable: aName
	^ (super hasTemporaryVariable: aName) or:[ parent hasTemporaryVariable: aName].