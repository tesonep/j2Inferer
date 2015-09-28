ast visiting
anASTContainerCreated:aContainer for:aVariable
	astContainerListener ifNotNil: [ astContainerListener anASTContainerCreated: aContainer for: aVariable ]