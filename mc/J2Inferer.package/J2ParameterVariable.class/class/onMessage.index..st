instance creation
onMessage: aMessage index:anIndex
	| v |
	v := self new.
	v message: aMessage.
	v index:anIndex.
	^v