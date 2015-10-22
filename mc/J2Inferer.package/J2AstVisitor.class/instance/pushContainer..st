accessing
pushContainer: aNewContainer
	containerStack push: aNewContainer.
	self inferer anASTContainerCreated:aNewContainer for:aNewContainer element.