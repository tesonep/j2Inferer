as yet unclassified
fill
	| classes env |
	env := RBBrowserEnvironment new.
	classes := env classes , env traits.
	selectors := Set new: 46000.
	classes do: [ :c | c methods do: [ :m | self addMethod: m ] ]