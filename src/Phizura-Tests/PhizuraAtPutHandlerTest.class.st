"
A PhizuraAtPutHandlerTest is a test class for testing the behavior of PhizuraAtPutHandler
"
Class {
	#name : 'PhizuraAtPutHandlerTest',
	#superclass : 'TestCase',
	#instVars : [
		'handler'
	],
	#category : 'Phizura-Tests-Handlers',
	#package : 'Phizura-Tests',
	#tag : 'Handlers'
}

{ #category : 'running' }
PhizuraAtPutHandlerTest >> setUp [

	super setUp.

	handler := PhizuraAtPutHandler new
		           instrumentedMethod: Performance >> #at:put:;
		           yourself
]

{ #category : 'tests' }
PhizuraAtPutHandlerTest >> testEmitCode [

	| result |
	result := PhizuraRecordEntry new
		          receiver: (handler receiverString: Performance uniqueInstance);
		          message: (handler messageString: {  #kick . 162 });
		          emitCode.
	self assert: result equals: 'Performance uniqueInstance at: #kick put: 162'
]
