initialization
initWithNotifier: aNotifier
	notifier := aNotifier.
	aNotifier inferer: self.
	queue notifier: aNotifier.

	self initPredefinedMessages