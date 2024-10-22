Class {
	#name : 'PhizuraPerformerArgHandlerTest',
	#superclass : 'TestCase',
	#instVars : [
		'handler'
	],
	#category : 'Phizura-Tests-Handlers',
	#package : 'Phizura-Tests',
	#tag : 'Handlers'
}

{ #category : 'running' }
PhizuraPerformerArgHandlerTest >> setUp [

	super setUp.

	handler := PhizuraPerformerArgHandler new
		           instrumentedMethod: Performance >> #performer:;
		           yourself
]

{ #category : 'tests' }
PhizuraPerformerArgHandlerTest >> testEmitCode [

	| result |
	result := PhizuraRecordEntry new
		          receiver: (handler receiverString: Performance uniqueInstance);
		          message: (handler messageString: { PerformerSuperDirt new });
		          emitCode.
	self assert: result equals: 'Performance uniqueInstance performer: PerformerSuperDirt new'
]
