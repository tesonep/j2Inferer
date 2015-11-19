as yet unclassified
withClass: aClass
	^ self new
		minClasses: (Set with:aClass);
		yourself