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
			 time: DateAndTime now;
			 method: instrumentedMethod;
			 receiver: anObject;
			 arguments: anArrayOfObjects;
			 yourself)
]

{ #category : 'evaluating' }
PhizuraInstrumenterHandler >> beforeMethod [

	records add: (PhizuraRecordEntry new
			 time: DateAndTime now;
			 method: instrumentedMethod;
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
