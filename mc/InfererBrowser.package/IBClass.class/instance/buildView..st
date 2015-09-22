accessing
buildView: builder
	builder stackedArrangement.
	builder title:'Class ', self element name.
	builder list
		title:'Instance Variables';
		display:[:each | each instanceVariables];
		format:#name.
	builder list
		title:'Methods';
		display:[:each | each methods];
		format:#name.
	