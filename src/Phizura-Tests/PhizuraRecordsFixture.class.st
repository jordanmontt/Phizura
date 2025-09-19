Class {
	#name : 'PhizuraRecordsFixture',
	#superclass : 'Object',
	#instVars : [
		'records'
	],
	#category : 'Phizura-Tests-Core',
	#package : 'Phizura-Tests',
	#tag : 'Core'
}

{ #category : 'initialization' }
PhizuraRecordsFixture >> initialize [

	| intitialTime |
	super initialize.
	intitialTime := DateAndTime now.
	records := OrderedCollection new.

	self newRecord: 'ep := EcoPhausto new.' withTime: intitialTime.
	self newRecord: 'ep playFor: 512 bars.' withTime: intitialTime + 1 second. 
	self newRecord:	 '#(1 0 0 1 0 0 0 0) asSeq to: #kick.' withTime: intitialTime + 2.5 second.
	self newRecord: '#rumba asRhythm to: #conga.' withTime: intitialTime + 4.3 second.
	self newRecord: '''0202'' hexBeat to: #snare.' withTime: intitialTime + 6.3 second
]

{ #category : 'instance creation' }
PhizuraRecordsFixture >> newRecord: codeAsString withTime: aTime [

    records add: (PhizuraEvaluationRecordEntry new
             time: aTime;
             expression: codeAsString;
             yourself)
]

{ #category : 'initialization' }
PhizuraRecordsFixture >> records [

    ^ records
]

{ #category : 'initialization' }
PhizuraRecordsFixture >> recordsUpTo: n [

    ^ records first: n
]
