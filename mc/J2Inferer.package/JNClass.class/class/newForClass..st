instance creation
newForClass: aClass 
	^ self basicNew
			analysedClass: aClass;
			initialize;
			yourself.