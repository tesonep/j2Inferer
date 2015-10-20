as yet unclassified
fillPackage: package from: inferer
	| classes |
	name := package name.
	totalVariables := 0.
	totalMethods := 0.
	totalParameters := 0.
	withDataVariables := 0.
	withDataReturn := 0.
	withDataParameters := 0.
	blockVariables := 0.
	blockReturnTypes := 0.
	classes := package classes reject: #isTrait.
	
	duration := [classes do: [ :cls | self processClass: cls from: inferer ] displayingProgress: [ :e | e name ]] timeToRun.