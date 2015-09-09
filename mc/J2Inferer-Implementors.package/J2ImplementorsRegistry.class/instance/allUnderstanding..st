as yet unclassified
allUnderstanding: aSelector
	^ allUnderstandingCache
		at: aSelector
		ifAbsentPut:
			[ ((self at: aSelector) methods collect: #methodClass) flatCollect: #withAllSubclasses ]