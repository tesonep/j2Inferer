accessing
buildView: builder
	builder title: 'Variable ', self element name , ' @ ' , self element containerClass name.
	builder
		list
			title:'Possible Classes of variable ', self name;
			display:[:each | each element possibleClasses]