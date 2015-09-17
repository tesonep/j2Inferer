asserts
assertAllMethodsOpened
	self assertCollection: ((inferer classes values flatCollect: #methods) reject:#isUpdated) equals: #().