baselines
baseline01: spec
	<version: '0.1-baseline'>
	spec
		for: #common
		do:
			[ 
			spec blessing: #baseline.
			spec
				package: 'J2Inferer' with: [ spec requires: #('SendersImplementors') ];
				package: 'SendersImplementors'
					with:
						[ spec repository: 'http://smalltalkhub.com/mc/CamilleTeruel/SendersImplementors/main' ].
			spec
				group: 'core' with: #('J2Inferer' 'SendersImplementors');
				group: 'dev' with: #('core' 'tests');
				group: 'tests' with: #() ]