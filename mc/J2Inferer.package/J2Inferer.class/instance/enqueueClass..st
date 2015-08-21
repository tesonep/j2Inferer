tasks operations
enqueueClass: aClass
	| aJ2Class| 
	aJ2Class := self typeInfoFor: aClass.
	aClass methodsDo: [ :m | self enqueueMethod: m onContext:{aJ2Class} ].
