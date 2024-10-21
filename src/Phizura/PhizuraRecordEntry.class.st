Class {
	#name : 'PhizuraRecordEntry',
	#superclass : 'Object',
	#instVars : [
		'time',
		'method',
		'receiver',
		'message'
	],
	#category : 'Phizura',
	#package : 'Phizura'
}

{ #category : 'printing' }
PhizuraRecordEntry >> emitCode [

	^ String streamContents: [ :aStream | aStream << receiver << ' ' << message ]
]

{ #category : 'accessing' }
PhizuraRecordEntry >> message [

	^ message
]

{ #category : 'accessing' }
PhizuraRecordEntry >> message: aString [

	message := aString
]

{ #category : 'accessing' }
PhizuraRecordEntry >> method [

	^ method
]

{ #category : 'accessing' }
PhizuraRecordEntry >> method: anObject [

	method := anObject
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

{ #category : 'accessing' }
PhizuraRecordEntry >> time [

	^ time
]

{ #category : 'accessing' }
PhizuraRecordEntry >> time: aDateAndTime [

	time := aDateAndTime
]
