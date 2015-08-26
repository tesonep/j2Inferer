accessing
generateMinClassesInContext: aContext alreadyEvaluated: alreadyEvaluated
	"^ (aContext flatCollect: [ :c | {c} , c allSubclasses ]) asSet"
	^ aContext asSet