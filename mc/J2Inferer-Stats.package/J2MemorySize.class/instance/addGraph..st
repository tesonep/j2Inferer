as yet unclassified
addGraph: root
	| analyzer clusterization analysis size|
	analyzer := FLAnalyzer new.
	analysis := analyzer analysisFor: J2InferenceManager inferer.
	clusterization := analysis clusterization.
	
	size := clusterization clusters sum:[:c| c objects size].
	objects := IdentitySet new: size.
	
	clusterization clusters do:[:c |
		c objects do:[:e|
			(self filter:e) ifTrue:[objects add:e].
		].
	]
