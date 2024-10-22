"
A PhizuraFreqHandlerTest is a test class for testing the behavior of PhizuraFreqHandler
"
Class {
	#name : 'PhizuraFreqHandlerTest',
	#superclass : 'TestCase',
	#instVars : [
		'handler'
	],
	#category : 'Phizura-Tests-Handlers',
	#package : 'Phizura-Tests',
	#tag : 'Handlers'
}

{ #category : 'running' }
PhizuraFreqHandlerTest >> setUp [

	super setUp.

	handler := PhizuraFreqHandler new
		           instrumentedMethod: Performance >> #freq:;
		           yourself
]

{ #category : 'tests' }
PhizuraFreqHandlerTest >> testEmitCode [

	| result |
	result := PhizuraRecordEntry new
		          receiver: (handler receiverString: Performance uniqueInstance);
		          message: (handler messageString: 162 bpm);
		          emitCode.
	self assert: result equals: 'Performance uniqueInstance freq: 162 bpm'
]

{ #category : 'tests' }
PhizuraFreqHandlerTest >> testMessageString [

	| result |
	result := handler messageString: 162 bpm.
	self assert: result equals: 'freq: 162 bpm'
]

{ #category : 'tests' }
PhizuraFreqHandlerTest >> testReceiverString [

	self assert: (handler receiverString: nil) equals: 'Performance uniqueInstance'
]
