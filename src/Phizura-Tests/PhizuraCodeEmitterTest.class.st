"
A PhizuraCodeEmitterTest is a test class for testing the behavior of PhizuraCodeEmitter
"
Class {
	#name : 'PhizuraCodeEmitterTest',
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
PhizuraCodeEmitterTest >> setUp [

    super setUp.
    codeEmitter := PhizuraCodeEmitter new.
    fixture := PhizuraRecordsFixture new
]

{ #category : 'tests' }
PhizuraCodeEmitterTest >> testEmitCleanCode [

	| expected |
	codeEmitter records: fixture records.
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

{ #category : 'tests' }
PhizuraCodeEmitterTest >> testEmitCode [

    | expected |
    codeEmitter records: fixture records.
    expected := 'ep := EcoPhausto new.
''ep := EcoPhausto new.'' toLocal: ''evaluatedCommand''.
1.0 seconds wait.

ep playFor: 512 bars.
''ep playFor: 512 bars.'' toLocal: ''evaluatedCommand''.
1.5 seconds wait.

#(1 0 0 1 0 0 0 0) asSeq to: #kick.
''#(1 0 0 1 0 0 0 0) asSeq to: #kick.'' toLocal: ''evaluatedCommand''.
1.8 seconds wait.

#rumba asRhythm to: #conga.
''#rumba asRhythm to: #conga.'' toLocal: ''evaluatedCommand''.
2.0 seconds wait.

''0202'' hexBeat to: #snare.
''''''0202'''' hexBeat to: #snare.'' toLocal: ''evaluatedCommand''.
'.
    self assert: codeEmitter emitMoofLODCode equals: expected
]

{ #category : 'tests' }
PhizuraCodeEmitterTest >> testEmitCodeOneRecord [

    | expected |
    codeEmitter records: (fixture recordsUpTo: 1).
    expected := 'ep := EcoPhausto new.
''ep := EcoPhausto new.'' toLocal: ''evaluatedCommand''.
'.
    self assert: codeEmitter emitMoofLODCode equals: expected
]

{ #category : 'tests' }
PhizuraCodeEmitterTest >> testEmitCodeSingleQuotesExample [

    | expected |
    codeEmitter records: { (PhizuraEvaluationRecordEntry new
             expression: '''1 , 2 , 3 , ~ '' asDirtNotes to: #casio';
             time: DateAndTime now) }.

    expected := '''1 , 2 , 3 , ~ '' asDirtNotes to: #casio.
''''''1 , 2 , 3 , ~ '''' asDirtNotes to: #casio.'' toLocal: ''evaluatedCommand''.
'.
    self assert: codeEmitter emitMoofLODCode equals: expected
]

{ #category : 'tests' }
PhizuraCodeEmitterTest >> testEmitCodeThreeRecords [

    | expected |
    codeEmitter records: (fixture recordsUpTo: 3).
    expected := 'ep := EcoPhausto new.
''ep := EcoPhausto new.'' toLocal: ''evaluatedCommand''.
1.0 seconds wait.

ep playFor: 512 bars.
''ep playFor: 512 bars.'' toLocal: ''evaluatedCommand''.
1.5 seconds wait.

#(1 0 0 1 0 0 0 0) asSeq to: #kick.
''#(1 0 0 1 0 0 0 0) asSeq to: #kick.'' toLocal: ''evaluatedCommand''.
'.
    self assert: codeEmitter emitMoofLODCode equals: expected
]

{ #category : 'tests' }
PhizuraCodeEmitterTest >> testEmitCodeTwoRecords [

    | expected |
    codeEmitter records: (fixture recordsUpTo: 2).
    expected := 'ep := EcoPhausto new.
''ep := EcoPhausto new.'' toLocal: ''evaluatedCommand''.
1.0 seconds wait.

ep playFor: 512 bars.
''ep playFor: 512 bars.'' toLocal: ''evaluatedCommand''.
'.
    self assert: codeEmitter emitMoofLODCode equals: expected
]
