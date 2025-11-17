Class {
	#name : 'PhizuraRecorder',
	#superclass : 'Object',
	#instVars : [
		'instrumenter',
		'records',
		'isActivated'
	],
	#category : 'Phizura-Core',
	#package : 'Phizura',
	#tag : 'Core'
}

{ #category : 'api' }
PhizuraRecorder class >> forceUnrecord [

	self flag:
		'This method is for emergencies. When the code is broken because of the MethodProxies, call this method to force to restore the original methods'.
	MpMethodProxy allInstances do: #uninstall
]

{ #category : 'api actions' }
PhizuraRecorder >> addRecord: aRecord [

    isActivated ifTrue: [ records add: aRecord ]
]

{ #category : 'inspector' }
PhizuraRecorder >> allRecords [

	^ records
]

{ #category : 'printing' }
PhizuraRecorder >> emitCode [

    ^ (PhizuraCodeEmitter onRecords: records) emitCode
]

{ #category : 'helper' }
PhizuraRecorder >> emitCodeOnNewPlayground [

(StPlaygroundPresenter new contents: self emitCode ) open.
]

{ #category : 'initialization' }
PhizuraRecorder >> initialize [

    super initialize.
    instrumenter := PhizuraEvaluationInstrumentor onRecorder: self.
    records := OrderedCollection new.
    isActivated := false
]

{ #category : 'inspector' }
PhizuraRecorder >> inspectRecords: aBuilder [

	<inspectorPresentationOrder: 0 title: 'Records'>
	| allRecords |
	allRecords := self allRecords.
	^ SpListPresenter new
		  items: allRecords;
		  yourself
]

{ #category : 'api actions' }
PhizuraRecorder >> record [

    instrumenter instrument.
    isActivated := true
]

{ #category : 'api actions' }
PhizuraRecorder >> stopRecording [

    isActivated := false.
    instrumenter uninstrument
]
