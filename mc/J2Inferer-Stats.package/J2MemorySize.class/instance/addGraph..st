as yet unclassified
addGraph: root
	| analyzer |
	analyzer := FLAnalyzer new.
	analysis := analyzer analysisFor: J2InferenceManager inferer.
	clusterization := analysis clusterization.