instance creation
with: contents
	| cs | 
	cs := contents.
	contents ifNil:[self halt].
	
	(contents isKindOf: J2Type ) ifTrue:[ cs := contents minClasses ].
	^ self basicNew
		contents: cs;
		initialize;
		yourself