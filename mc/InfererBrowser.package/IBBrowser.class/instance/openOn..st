as yet unclassified
openOn: aIBModel
	pager := GLMPager new.
	pager title: 'Type Inferer Browser'.
	pager with: [ :factory | factory show: [ :builder :element | element buildView: builder ] ].
	pager openOn: aIBModel