Class {
	#name : 'PhizuraPerformanceCodeEmitterTest',
	#superclass : 'TestCase',
	#instVars : [
		'codeEmitter',
		'fixture'
	],
	#category : 'Phizura-Tests-Core',
	#package : 'Phizura-Tests',
	#tag : 'Core'
}

{ #category : 'running' }
PhizuraPerformanceCodeEmitterTest >> setUp [

    super setUp.
    codeEmitter := PhizuraCodeEmitter new.
    fixture := PhizuraRecordsFixture new
]

{ #category : 'tests' }
PhizuraPerformanceCodeEmitterTest >> testEmitCleanCode [

	| expected |
	codeEmitter records: fixture recordsWithKeyStrokes.
	expected := 'ep := EcoPhausto new.
1.0 seconds wait.

ep playFor: 512 bars.
1.5 seconds wait.

#(1 0 0 1 0 0 0 0) asSeq to: #kick.
1.8 seconds wait.

#rumba asRhythm to: #conga.
2.0 seconds wait.

''0202'' hexBeat to: #snare.
'.
	self assert: codeEmitter emitPerformanceCode equals: expected
]
