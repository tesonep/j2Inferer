initialization
initialize
	super initialize.
	file := File new named: 'salida.out'; openForAppend.
	stream := file writeStream.
	logLevels:=Dictionary new.
	logLevels at:#error put:1. 
	logLevels at:#info put:2. 
	logLevels at:#debug put:3.
	logLevels at:#trace put:4.
	currentLogLevel := 3.