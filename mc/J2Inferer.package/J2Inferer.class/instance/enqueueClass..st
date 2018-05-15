tasks operations
enqueueClass: aClass
	aClass methodsDo: [ :m | self enqueueMethod: m ].
