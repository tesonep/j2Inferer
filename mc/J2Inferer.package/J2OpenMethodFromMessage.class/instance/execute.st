executing
execute
	self inferer notifier openingMessage: self message.
	impls do: [ :e | self inferer enqueueMethod: e ]