Class {
	#name : 'PhizuraBasicHandler',
	#superclass : 'MpHandler',
	#instVars : [
		'instrumentedMethod',
		'recorder'
	],
	#category : 'Phizura',
	#package : 'Phizura'
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
			 method: self methodName;
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
PhizuraBasicHandler >> methodName [

	^ instrumentedMethod name
]

{ #category : 'evaluating' }
PhizuraBasicHandler >> receiverString: anObject [

	^ 'Performance uniqueInstance'
]

{ #category : 'accessing' }
PhizuraBasicHandler >> recorder: aRecorder [ 
	recorder := aRecorder
]