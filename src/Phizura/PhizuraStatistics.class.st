Class {
    #name : 'PhizuraStatistics',
    #superclass : 'Object',
    #instVars : [
        'records',
        'startTime',
        'endTime'
    ],
    #category : 'Phizura-Analysis',
    #package : 'Phizura'
}

{ #category : 'instance creation' }
PhizuraStatistics class >> fromRecords: aCollection [
    ^ self new
        initializeWithRecords: aCollection;
        yourself

{ #category : 'initialization' }
PhizuraStatistics >> initializeWithRecords: aCollection [
    records := aCollection.
    records ifNotEmpty: [
        startTime := (records first time) asDateAndTime.
        endTime := (records last time) asDateAndTime
    ]
]

{ #category : 'analysis' }
PhizuraStatistics >> performanceDuration [
    "Returns the total duration of the performance in seconds"
    records ifEmpty: [ ^ 0 seconds ].
    ^ endTime - startTime
]

{ #category : 'analysis' }
PhizuraStatistics >> methodFrequencies [
    "Returns a Dictionary with the frequency of each method call"
    ^ records inject: Dictionary new into: [ :dict :record |
        dict 
            at: record message
            update: [ :count | count + 1 ]
            initial: [ 1 ];
            yourself
    ]
]

{ #category : 'analysis' }
PhizuraStatistics >> tempoChanges [
    "Returns a collection of tempo changes during the performance"
    ^ records 
        select: [ :record | record message beginsWith: 'freq:' ]
        thenCollect: [ :record | 
            | bpm |
            bpm := (record message copyAfter: $:) trimBoth asNumber.
            Dictionary new
                at: #timestamp put: record time;
                at: #bpm put: bpm;
                yourself
        ]
]

{ #category : 'analysis' }
PhizuraStatistics >> averageTempoChangesPerMinute [
    "Calculate the average number of tempo changes per minute"
    | changes duration |
    changes := self tempoChanges size.
    duration := self performanceDuration asMinutes.
    duration isZero ifTrue: [ ^ 0 ].
    ^ (changes / duration) asFloat
]

{ #category : 'printing' }
PhizuraStatistics >> printOn: aStream [
    super printOn: aStream.
    aStream 
        << '(';
        << records size asString;
        << ' events, ';
        << self performanceDuration asSeconds asString;
        << 's)'
] 