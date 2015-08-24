api projectSpec
baseline: spec
	<baseline>
	spec
		for: #pharo
		do:
			[ 
			spec
				package: 'J2Inferer'
					with: [ 
					spec requires: #('SendersImplementors').
					spec repository: 'filetree://./mc' ];
				package: 'SendersImplementors' with: [ spec repository: 'http://smalltalkhub.com/mc/CamilleTeruel/SendersImplementors/main' ].
			spec
				group: 'core' with: #('J2Inferer' 'SendersImplementors');
				group: 'dev' with: #('core' 'tests');
				group: 'tests' with: #() ]