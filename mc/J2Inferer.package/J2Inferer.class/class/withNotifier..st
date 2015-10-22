instance creation
withNotifier: aNotifier
	instance := self basicNew.
	^ instance
		notifier: aNotifier;
		initialize;
		yourself.
