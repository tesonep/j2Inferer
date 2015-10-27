as yet unclassified
execute
	((self inferer classes values flatCollect:#methods) reject:#isUpdated ) do:[ :e |
		self inferer enqueueMethod: e	method
	]