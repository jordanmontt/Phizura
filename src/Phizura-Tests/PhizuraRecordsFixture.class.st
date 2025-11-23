Class {
	#name : 'PhizuraRecordsFixture',
	#superclass : 'Object',
	#instVars : [
		'records',
		'initialTime'
	],
	#category : 'Phizura-Tests-Core',
	#package : 'Phizura-Tests',
	#tag : 'Core'
}

{ #category : 'initialization' }
PhizuraRecordsFixture >> initialize [

	super initialize.
	initialTime := DateAndTime now.
	records := OrderedCollection new.

	self newEvaluationRecord: 'ep := EcoPhausto new.' withTime: initialTime.
	self newEvaluationRecord: 'ep playFor: 512 bars.' withTime: initialTime + 1 second. 
	self newEvaluationRecord:	 '#(1 0 0 1 0 0 0 0) asSeq to: #kick.' withTime: initialTime + 2.5 second.
	self newEvaluationRecord: '#rumba asRhythm to: #conga.' withTime: initialTime + 4.3 second.
	self newEvaluationRecord: '''0202'' hexBeat to: #snare.' withTime: initialTime + 6.3 second
]

{ #category : 'instance creation' }
PhizuraRecordsFixture >> newEvaluationRecord: codeAsString withTime: aTime [

	records add:
		(PhizuraEvaluationRecordEntry expression: codeAsString time: aTime)
]

{ #category : 'instance creation' }
PhizuraRecordsFixture >> newKeyRecord: aCharacter withTime: aTime inCollection: aCollection [

	aCollection add: (PhizuraKeyEventRecordEntry
			 time: aTime
			 key: (KeyboardKey fromCharacter: aCharacter))
]

{ #category : 'initialization' }
PhizuraRecordsFixture >> records [

    ^ records
]

{ #category : 'initialization' }
PhizuraRecordsFixture >> recordsUpTo: n [

    ^ records first: n
]

{ #category : 'initialization' }
PhizuraRecordsFixture >> recordsWithKeyStrokes [
	"self newEvaluationRecord: 'ep := EcoPhausto new.' withTime: intitialTime.
	self newEvaluationRecord: 'ep playFor: 512 bars.' withTime: intitialTime + 1 second. 
	self newEvaluationRecord:	 '#(1 0 0 1 0 0 0 0) asSeq to: #kick.' withTime: intitialTime + 2.5 second.
	self newEvaluationRecord: '#rumba asRhythm to: #conga.' withTime: intitialTime + 4.3 second.
	self newEvaluationRecord: '''0202'' hexBeat to: #snare.' withTime: intitialTime + 6.3 second"

	| newRecords |
	newRecords := OrderedCollection with: records first.
	
	self newKeyRecord: #e withTime: initialTime + 0.1 seconds inCollection: newRecords.
	self newKeyRecord: #p withTime: initialTime + 0.2 seconds inCollection: newRecords.
	self newKeyRecord: #space withTime: initialTime + 0.3 seconds inCollection: newRecords.
	self newKeyRecord: #E withTime: initialTime + 0.5 seconds inCollection: newRecords.

	^ newRecords , records allButFirst
]
