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
PhizuraRecorder >> emitMoofLODCode [

    ^ (PhizuraCodeEmitter onRecords: records) emitMoofLODCode
]

{ #category : 'printing' }
PhizuraRecorder >> emitPerformanceCode [

	^ (PhizuraCodeEmitter onRecords: records) emitPerformanceCode
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

{ #category : 'accessing' }
PhizuraRecorder >> records [
	^ records
]

{ #category : 'api actions' }
PhizuraRecorder >> stopRecording [

    isActivated := false.
    instrumenter uninstrument
]
