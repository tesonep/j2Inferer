initialization
initPredefinedMessages
	" This message initialize all the configuration for the predefined messages."

	predefinedMessages add: (J2BasicNewMessage forInferer: self).
	predefinedMessages add: (J2ArithmeticOperationsMessage forInferer: self)