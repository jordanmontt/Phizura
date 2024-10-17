Class {
	#name : 'CoypuRecordEntry',
	#superclass : 'Object',
	#instVars : [
		'time',
		'method',
		'receiver',
		'arguments'
	],
	#category : 'MpCoypuRecorder',
	#package : 'MpCoypuRecorder'
}

{ #category : 'accessing' }
CoypuRecordEntry >> arguments [

	^ arguments
]

{ #category : 'accessing' }
CoypuRecordEntry >> arguments: anObject [

	arguments := anObject
]

{ #category : 'accessing' }
CoypuRecordEntry >> method [

	^ method
]

{ #category : 'accessing' }
CoypuRecordEntry >> method: anObject [

	method := anObject
]

{ #category : 'printing' }
CoypuRecordEntry >> printOn: aStream [

	aStream << method selector << ' -> ' << time asTime print24
]

{ #category : 'accessing' }
CoypuRecordEntry >> receiver [

	^ receiver
]

{ #category : 'accessing' }
CoypuRecordEntry >> receiver: anObject [

	receiver := anObject
]

{ #category : 'accessing' }
CoypuRecordEntry >> time [

	^ time
]

{ #category : 'accessing' }
CoypuRecordEntry >> time: aDateAndTime [

	time := aDateAndTime
]
