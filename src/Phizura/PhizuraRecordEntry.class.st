Class {
	#name : 'PhizuraRecordEntry',
	#superclass : 'PhizuraBasicRecordEntry',
	#instVars : [
		'receiver'
	],
	#category : 'Phizura-Core',
	#package : 'Phizura',
	#tag : 'Core'
}

{ #category : 'printing' }
PhizuraRecordEntry >> emitCode [

	^ String streamContents: [ :aStream | aStream << receiver << ' ' << message ]
]

{ #category : 'printing' }
PhizuraRecordEntry >> printOn: aStream [

	aStream << self emitCode
]

{ #category : 'accessing' }
PhizuraRecordEntry >> receiver [

	^ receiver
]

{ #category : 'accessing' }
PhizuraRecordEntry >> receiver: anObject [

	receiver := anObject
]
