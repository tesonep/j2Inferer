initialization
initPredefinedMessages
	" This message initialize all the configuration for the predefined messages."

	predefinedMessages add: (J2BasicNewPredefinedMethod forInferer: self).
	predefinedMessages add: (J2ArithmeticOperationsPredefinedMethod forInferer: self).
	predefinedMessages add: (J2BlockPredefinedMethod forInferer: self).