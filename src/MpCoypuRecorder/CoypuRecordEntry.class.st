Class {
	#name : 'CoypuRecordEntry',
	#superclass : 'Object',
	#instVars : [
		'time',
		'method'
	],
	#category : 'MpCoypuRecorder',
	#package : 'MpCoypuRecorder'
}

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
CoypuRecordEntry >> time [

	^ time
]

{ #category : 'accessing' }
CoypuRecordEntry >> time: aDateAndTime [

	time := aDateAndTime
]
