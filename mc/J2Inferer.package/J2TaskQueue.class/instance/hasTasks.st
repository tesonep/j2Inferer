accessing
hasTasks
	^ queue values anySatisfy: [ :e | e isNotEmpty ]