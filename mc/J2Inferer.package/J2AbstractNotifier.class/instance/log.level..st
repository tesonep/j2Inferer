logging
log: aValuable level:logLevel
	(self hasToLog: logLevel) ifFalse: [ ^self ].
	^self doLog: aValuable level:logLevel.
