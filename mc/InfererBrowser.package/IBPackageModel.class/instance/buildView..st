accessing
buildView: builder
	builder title:'Type Info >> Package ', self element name.
	builder list 
		display:[:each | self classes];
		format:[:each | each name]