Class {
	#name : 'PhizuraRecordEntry',
	#superclass : 'Object',
	#instVars : [
		'time',
		'method',
		'receiver',
		'arguments'
	],
	#category : 'Phizura',
	#package : 'Phizura'
}

{ #category : 'accessing' }
PhizuraRecordEntry >> arguments [

	^ arguments
]

{ #category : 'accessing' }
PhizuraRecordEntry >> arguments: anObject [

	arguments := anObject
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

	aStream << method selector << ' -> ' << time asTime print24
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
