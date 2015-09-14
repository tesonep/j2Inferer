as yet unclassified
execute
	((inferer classes values flatCollect:#methods) reject:#isUpdated ) do:[ :e |
		inferer enqueueMethod: e	method
	]