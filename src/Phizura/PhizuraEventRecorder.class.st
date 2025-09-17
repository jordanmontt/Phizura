Class {
	#name : 'PhizuraEventRecorder',
	#superclass : 'PhizuraRecorder',
	#category : 'Phizura',
	#package : 'Phizura'
}

{ #category : 'initialization' }
PhizuraEventRecorder >> initialize [

	super initialize.
	instrumenter := PhizuraEventRecorderInstrumentor onRecorder: self
]
