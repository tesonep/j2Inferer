instance creation
newFor: anotherVariable onMessage: aMessage index:anIndex
	| v |
	v := self new.
	v message: aMessage.
	v index:anIndex.
	v variable: anotherVariable.
	^v