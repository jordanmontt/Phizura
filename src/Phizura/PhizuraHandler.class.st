Class {
	#name : 'PhizuraHandler',
	#superclass : 'MpHandler',
	#instVars : [
		'recorder'
	],
	#category : 'Phizura-Handlers',
	#package : 'Phizura',
	#tag : 'Handlers'
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
	"We instrument a method that we know that it has one argument."
	argument := anArrayOfArguments first.

	recorder addRecord: (PhizuraRecordEntry new
			 time: DateAndTime now;
			 expression: argument;
			 yourself)
]

{ #category : 'accessing' }
PhizuraHandler >> recorder: aRecorder [

	recorder := aRecorder
]
