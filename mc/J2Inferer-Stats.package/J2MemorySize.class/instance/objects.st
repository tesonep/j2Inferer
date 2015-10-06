as yet unclassified
objects
	^ (clusterization clusters flatCollect: #objects) reject:[:e| e isClass or:[e isTrait]].