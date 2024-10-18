Class {
	#name : 'PhizuraRecorder',
	#superclass : 'Object',
	#instVars : [
		'instrumenter'
	],
	#category : 'Phizura',
	#package : 'Phizura'
}

{ #category : 'api' }
PhizuraRecorder class >> forceUnrecord [

	self flag:
		'This method is for emergencies. When the code is broken because of the MethodProxies, call this method to force to restore the original methods'.
	MpMethodProxy allInstances do: #uninstall
]

{ #category : 'inspector' }
PhizuraRecorder >> allRecords [

	^ instrumenter allRecords
]

{ #category : 'api - exporting' }
PhizuraRecorder >> exportAsJSON [

	^ (PhizuraJSONExporter onRecorder: self) export
]

{ #category : 'initialization' }
PhizuraRecorder >> initialize [

	super initialize.
	instrumenter := PhizuraInstrumenter new
]

{ #category : 'inspector' }
PhizuraRecorder >> inspectRecords [

	<inspectorPresentationOrder: 0 title: 'records'>
	| allRecords |
	allRecords := self allRecords.
	^ SpListPresenter new
		  items: allRecords;
		  yourself
]

{ #category : 'api actions' }
PhizuraRecorder >> record [

	instrumenter instrument
]

{ #category : 'api actions' }
PhizuraRecorder >> unrecord [

	instrumenter uninstrument
]
