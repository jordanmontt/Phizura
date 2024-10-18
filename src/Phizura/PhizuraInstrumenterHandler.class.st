Class {
	#name : 'PhizuraInstrumenterHandler',
	#superclass : 'MpHandler',
	#instVars : [
		'records',
		'instrumentedMethod'
	],
	#category : 'Phizura',
	#package : 'Phizura'
}

{ #category : 'evaluating' }
PhizuraInstrumenterHandler >> beforeExecutionWithReceiver: anObject arguments: anArrayOfObjects [

	records add: (PhizuraRecordEntry new
			 time: DateAndTime now asString;
			 method: instrumentedMethod name;
			 receiver: anObject asString;
			 arguments: anArrayOfObjects asString;
			 yourself)
]

{ #category : 'initialization' }
PhizuraInstrumenterHandler >> initialize [ 

	super initialize. 
	records := OrderedCollection new
]

{ #category : 'accessing' }
PhizuraInstrumenterHandler >> instrumentedMethod: aMethod [

	instrumentedMethod := aMethod
]

{ #category : 'accessing' }
PhizuraInstrumenterHandler >> records [

	^ records
]
