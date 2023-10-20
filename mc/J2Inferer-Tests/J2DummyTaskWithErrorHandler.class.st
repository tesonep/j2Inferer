"
This Dummy Task is used to test the error handling.

"
Class {
	#name : #J2DummyTaskWithErrorHandler,
	#superclass : #J2DummyTask,
	#category : 'J2Inferer-Tests-Tasks'
}

{ #category : #'error handling' }
J2DummyTaskWithErrorHandler >> onError:anError [.
	test reportErrorHandled.
]
