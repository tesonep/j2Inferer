comparing
compareToOpenMethodTask: anotherTask
	^ method == anotherTask method	
		
	"I'm using identity because two methods can be the same if they have the same bytecode. It doesn't matter the selector or the hosting class"