Class {
	#name : 'PhizuraBasicHandler',
	#superclass : 'MpHandler',
	#instVars : [
		'instrumentedMethod',
		'recorder'
	],
	#category : 'Phizura-Handlers',
	#package : 'Phizura',
	#tag : 'Handlers'
}

{ #category : 'instance creation' }
PhizuraBasicHandler class >> onRecorder: aRecorder [

	^ self new
		recorder: aRecorder;
		yourself
]

{ #category : 'evaluating' }
PhizuraBasicHandler >> beforeExecutionWithReceiver: anObject arguments: anArrayOfObjects [

	recorder addRecord: (PhizuraRecordEntry new
			 time: DateAndTime now asString;
			 receiver: (self receiverString: anObject);
			 message: (self messageString: anArrayOfObjects);
			 yourself)
]

{ #category : 'accessing' }
PhizuraBasicHandler >> instrumentedMethod: aMethod [

	instrumentedMethod := aMethod
]

{ #category : 'evaluating' }
PhizuraBasicHandler >> messageString: anArray [

	^ instrumentedMethod selector
]

{ #category : 'evaluating' }
PhizuraBasicHandler >> receiverString: anObject [

	^ 'Performance uniqueInstance'
]

{ #category : 'accessing' }
PhizuraBasicHandler >> recorder: aRecorder [ 
	recorder := aRecorder
]
