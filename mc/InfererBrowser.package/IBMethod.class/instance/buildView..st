as yet unclassified
buildView: builder
	builder stackedArrangement.
	builder list
		title:'Possible Classes of the Returned Value';
		display:[ :each | each element returnType possibleClasses].
	builder list
		title:'Parameters';
		display:[ :each | each parameters];
		format: #name		