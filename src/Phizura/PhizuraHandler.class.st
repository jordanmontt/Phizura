Class {
	#name : 'PhizuraHandler',
	#superclass : 'MpHandler',
	#instVars : [
		'recorder'
	],
	#category : 'Phizura-Instrumentation',
	#package : 'Phizura',
	#tag : 'Instrumentation'
}

{ #category : 'instance creation' }
PhizuraHandler class >> onRecorder: aRecorder [

	^ self new
		recorder: aRecorder;
		yourself
]

{ #category : 'evaluating' }
PhizuraHandler >> beforeExecutionWithReceiver: anObject arguments: anArrayOfArguments [

    | argument |
    "The first argument of the instrumeted method is the code (expression) that is being evaluated"
    argument := anArrayOfArguments first.

    recorder addRecord: (PhizuraEvaluationRecordEntry new
            time: DateAndTime now;
            expression: argument;
            yourself)
]

{ #category : 'accessing' }
PhizuraHandler >> recorder: aRecorder [

	recorder := aRecorder
]
