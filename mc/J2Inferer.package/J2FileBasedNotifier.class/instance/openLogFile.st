file-handling
openLogFile
	file := File new
		named: 'salida.out';
		yourself.
	file openForWrite.
	stream := file writeStream