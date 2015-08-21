statistics
statistics
	^ 'Classes: ' , classes size asString , ' Literals: ' , literals size asString
		, ' Globals: ' , globals size asString , ' Methods: '
		, (classes sum: #numberOfMethods) asString , ' Queue Size: ' , queue size asString , ' content: ', queue pendingTasksStatistics