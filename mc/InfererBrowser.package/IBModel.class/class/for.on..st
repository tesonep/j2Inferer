instance creation
for: anElement on: aContext
	^ self new for:anElement using:anElement inferer context:aContext;
		yourself.