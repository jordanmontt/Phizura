Class {
	#name : 'PhizuraBasicRecordEntry',
	#superclass : 'Object',
	#instVars : [
		'time',
		'message'
	],
	#category : 'Phizura-Core',
	#package : 'Phizura',
	#tag : 'Core'
}

{ #category : 'printing' }
PhizuraBasicRecordEntry >> emitCode [

	^ message
]

{ #category : 'accessing' }
PhizuraBasicRecordEntry >> message [

	^ message
]

{ #category : 'accessing' }
PhizuraBasicRecordEntry >> message: aString [

	message := aString
]

{ #category : 'printing' }
PhizuraBasicRecordEntry >> printOn: aStream [

	aStream << self emitCode
]

{ #category : 'accessing' }
PhizuraBasicRecordEntry >> time [

	^ time
]

{ #category : 'accessing' }
PhizuraBasicRecordEntry >> time: aDateAndTime [

	time := aDateAndTime
]
