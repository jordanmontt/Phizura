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

{ #category : 'tests' }
PhizuraAtPutHandlerTest >> testEmitCode [

	| result |
	handler := PhizuraFreqHandler new
		           instrumentedMethod: Performance >> #freq:;
		           yourself.
	result := (handler receiverString: Performance uniqueInstance) , ' '
	          , (handler messageString: 162 bpm).
	self assert: result equals: 'Performance uniqueInstance freq: 162 bpm'
]
