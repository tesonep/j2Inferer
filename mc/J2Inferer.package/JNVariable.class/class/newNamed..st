instance creation
newNamed: aName
	^ self basicNew 
			name: aName;
			initialize;
			yourself.