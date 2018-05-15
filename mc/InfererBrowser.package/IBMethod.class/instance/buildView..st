accessing
buildView: builder
	builder stackedArrangement.
	builder title:'Method ', self element name.	
	builder list
		title:'Possible Classes of the Returned Value';
		display:[ :each | 
			(each element returnValue possibleClasses:context) collect:#asIBModel];
		format: #name.
	builder list
		title:'Parameters';
		display:[ :each | each parameters];
		format: #name		