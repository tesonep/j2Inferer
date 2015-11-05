instance creation
newForClass: aClass 
	^ self basicNew
			name: aClass name;
			initialize;
			yourself.