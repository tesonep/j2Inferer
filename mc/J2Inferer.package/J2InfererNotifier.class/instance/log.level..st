logging
log: aValuable level:logLevel
	(self hasToLog: logLevel) ifFalse: [ ^self ].
	stream << aValuable value.
	stream crlf.
	stream flush