Class {
	#name : 'PhizuraBasicRecordEntry',
	#superclass : 'Object',
	#instVars : [
		'time'
	],
	#category : 'Phizura',
	#package : 'Phizura'
}

{ #category : 'testing' }
PhizuraBasicRecordEntry >> isKeyEntryRecord [

    ^ false
]

{ #category : 'accessing' }
PhizuraBasicRecordEntry >> time [

	^ time
]

{ #category : 'accessing' }
PhizuraBasicRecordEntry >> time: aDateAndTime [

	time := aDateAndTime
]
