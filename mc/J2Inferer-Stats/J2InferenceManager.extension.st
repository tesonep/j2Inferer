Extension { #name : #J2InferenceManager }

{ #category : #'*J2Inferer-Stats' }
J2InferenceManager classSide >> calculateStatistics [
	stats := J2InfererStats new.
	stats fillPackages: RBPackageEnvironment default packages from: J2Inferer instance.
	^ stats.
]

{ #category : #'*J2Inferer-Stats' }
J2InferenceManager classSide >> statistics [
	^ stats
]
