as yet unclassified
openOn: aPackage using: anInferer
	pager := GLMPager new.
	pager title: 'Type Inferer Browser'.
	pager with: [ :factory | factory show: [ :builder :element | element buildView: builder ] ].
	pager openOn: (IBPackageModel for: J2Inferer package using: J2Scripts inferer)