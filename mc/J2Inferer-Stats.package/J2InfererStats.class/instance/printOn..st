printing
printOn: aStream
	aStream << 'Inferer stats:'; crlf;
			<< '  Packages: '; << results size printString; crlf;
			<< '  Average instance variables with data: '; << (self averageInstanceVariablesWithData * 100.0) printString; crlf;
			<< '  Average methods return with data: ' ; << (self averageMethodsReturnTypeWithData * 100.0) printString; crlf;
			<< '  Average parameters with data: ' ; << (self averageParametersWithData * 100.0) printString; crlf;
			<< '  Duration: '; << self duration printString.
	