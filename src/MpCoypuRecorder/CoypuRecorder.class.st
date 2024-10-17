Class {
	#name : 'CoypuRecorder',
	#superclass : 'Object',
	#instVars : [
		'instrumenter'
	],
	#category : 'MpCoypuRecorder',
	#package : 'MpCoypuRecorder'
}

{ #category : 'api' }
CoypuRecorder class >> forceUnrecord [

	self flag:
		'This method is for emergencies. When the code is broken because of the MethodProxies, call this method to force to restore the original methods'.
	MpMethodProxy allInstances do: #uninstall
]

{ #category : 'initialization' }
CoypuRecorder >> initialize [

	super initialize.
	instrumenter := CoypuInstrumenter new
]

{ #category : 'inspector' }
CoypuRecorder >> inspectRecords [

	<inspectorPresentationOrder: 0 title: 'records'>
	| allRecords |
	allRecords := instrumenter allRecords.
	^ SpListPresenter new
		  items: allRecords;
		  yourself
]

{ #category : 'api actions' }
CoypuRecorder >> record [

	instrumenter instrument
]

{ #category : 'api actions' }
CoypuRecorder >> unrecord [

	instrumenter uninstrument
]
