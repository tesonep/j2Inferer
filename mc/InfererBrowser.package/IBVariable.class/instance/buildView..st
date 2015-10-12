accessing
buildView: builder
	builder stackedArrangement.
	builder title: self title.
	builder
		list
			title:'Possible Classes of variable ', self name;
			display:[:each | (each element possibleClasses: context) collect:#asIBModel];
			format:#name.
	builder 
		list 
			title:'Messages sent to ',self name;
			display:[:each | each element allSelectors: context].
			