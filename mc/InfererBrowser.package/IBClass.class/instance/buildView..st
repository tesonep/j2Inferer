accessing
buildView: builder
	builder stackedArrangement.
	builder list
		title:'Instance Variables';
		display:[:each | each instanceVariables];
		format:#name.
	builder list
		title:'Methods';
		display:[:each | each methods];
		format:#name.
	