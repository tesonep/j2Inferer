*J2Inferer-Stats
calculateStatistics
	stats := J2InfererStats new.
	stats fillPackages: RBPackageEnvironment default packages from: inferer.
	^ stats.