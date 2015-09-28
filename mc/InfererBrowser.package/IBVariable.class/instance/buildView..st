accessing
buildView: builder
	builder title: self title.
	builder
		list
			title:'Possible Classes of variable ', self name;
			display:[:each | each element possibleClasses]