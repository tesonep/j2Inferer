as yet unclassified
hasTasks
	^ queue values anySatisfy: [ :e | e isNotEmpty ]