tasks operations
enqueueClass: aClass
	self haltIf: [aClass name = #CharacterBlock ].
	aClass methodsDo: [ :m | self enqueueMethod: m ].
