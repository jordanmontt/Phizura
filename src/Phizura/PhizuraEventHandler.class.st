Class {
	#name : 'PhizuraEventHandler',
	#superclass : 'MpHandler',
	#instVars : [
		'recorder'
	],
	#category : 'Phizura-Handlers',
	#package : 'Phizura',
	#tag : 'Handlers'
}

{ #category : 'instance creation' }
PhizuraEventHandler class >> onRecorder: aRecorder [

	^ self new
		recorder: aRecorder;
		yourself
]

{ #category : 'evaluating' }
PhizuraEventHandler >> beforeExecutionWithReceiver: anObject arguments: anArrayOfArguments [

	recorder addRecord: (PhizuraBasicRecordEntry new
			 time: DateAndTime now;
			 message: (self messageString: anArrayOfArguments);
			 yourself).
	
	anArrayOfArguments first toLocal: 'evaluatedCommand'.

	
]

{ #category : 'evaluating' }
PhizuraEventHandler >> messageString: anArrayOfObjects [

	^ anArrayOfObjects first
]

{ #category : 'accessing' }
PhizuraEventHandler >> recorder: aRecorder [

	recorder := aRecorder
]
