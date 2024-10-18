Class {
	#name : 'PhizuraJSONExporter',
	#superclass : 'Object',
	#instVars : [
		'recorder'
	],
	#category : 'Phizura',
	#package : 'Phizura'
}

{ #category : 'instance creation' }
PhizuraJSONExporter class >> onRecorder: aRecorder [

	^ self new
		  recorder: aRecorder;
		  yourself
]

{ #category : 'api - exporting' }
PhizuraJSONExporter >> export [

	| fileName writeStream jsonObjects |
	fileName :=  self generateJSONFileName.

	jsonObjects := recorder allRecords collect: [ :e |
		Dictionary new
			at: #method put: e method;
			at: #timestamp put: e time;
			at: #receiver put: e receiver;
			at: #arguments put: e arguments;
			yourself ].

	writeStream := fileName asFileReference createFile writeStream.	
	(NeoJSONWriter on: writeStream) nextPut: jsonObjects.
	writeStream close
]

{ #category : 'api - exporting' }
PhizuraJSONExporter >> generateJSONFileName [

	^ String streamContents: [ :stream |
		  stream << 'phizura-' << DateAndTime now monthAbbreviation << '-'.
		  DateAndTime now dayOfMonth printOn: stream.
		  stream << '-'.
		  DateAndTime now hour24 printOn: stream.
		  stream << 'h'.
		  DateAndTime now minute printOn: stream.
		  stream << 'm'.
		  stream << '.json' ]
]

{ #category : 'api - exporting' }
PhizuraJSONExporter >> recorder: aRecorder [

	recorder := aRecorder
]
