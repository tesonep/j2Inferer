accessing
pushContainer: aNewContainer
	containerStack push: aNewContainer.
	inferer anASTContainerCreated:aNewContainer for:aNewContainer element.