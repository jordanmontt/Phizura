Class {
	#name : 'CoypuInstrumenterHandler',
	#superclass : 'MpHandler',
	#instVars : [
		'records',
		'instrumentedMethod'
	],
	#category : 'MpCoypuRecorder',
	#package : 'MpCoypuRecorder'
}

{ #category : 'evaluating' }
CoypuInstrumenterHandler >> beforeExecutionWithReceiver: anObject arguments: anArrayOfObjects [

	records add: (CoypuRecordEntry new
			 time: DateAndTime now;
			 method: instrumentedMethod;
			 receiver: anObject;
			 arguments: anArrayOfObjects;
			 yourself)
]

{ #category : 'evaluating' }
CoypuInstrumenterHandler >> beforeMethod [

	records add: (CoypuRecordEntry new
			 time: DateAndTime now;
			 method: instrumentedMethod;
			 yourself)
]

{ #category : 'initialization' }
CoypuInstrumenterHandler >> initialize [ 

	super initialize. 
	records := OrderedCollection new
]

{ #category : 'accessing' }
CoypuInstrumenterHandler >> instrumentedMethod: aMethod [

	instrumentedMethod := aMethod
]

{ #category : 'accessing' }
CoypuInstrumenterHandler >> records [

	^ records
]
