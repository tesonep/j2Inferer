logging
hasToLog: level
	| levelValue |
	levelValue := logLevels at:level ifAbsent:9.
	^ currentLogLevel >= levelValue.