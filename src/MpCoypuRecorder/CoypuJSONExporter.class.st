Class {
	#name : 'CoypuJSONExporter',
	#superclass : 'Object',
	#instVars : [
		'recorder'
	],
	#category : 'MpCoypuRecorder',
	#package : 'MpCoypuRecorder'
}

{ #category : 'instance creation' }
CoypuJSONExporter class >> onRecorder: aRecorder [

	^ self new
		  recorder: aRecorder;
		  yourself
]

{ #category : 'api - exporting' }
CoypuJSONExporter >> export [

	| fileName writeStream jsonObjects |
	fileName :=  String streamContents: [ :stream | stream << 'coypu-record-session' <<
		DateAndTime now monthAbbreviation. 
		DateAndTime now dayOfMonth printOn: stream.
		DateAndTime now hour24 printOn: stream.
		DateAndTime now minute printOn: stream.
		stream << '.json' ].

	jsonObjects := recorder allRecords collect: [ :e |
		Dictionary new
			at: #method put: e method name;
			at: #timestamp put: e time asString;
			at: #receiver put: e receiver asString;
			at: #arguments put: e arguments asString;
			yourself ].

	writeStream := fileName asFileReference createFile writeStream.
	
	"jsonObjects doWithIndex: [ :jsonMap :index |
		writeStream << (NeoJSONWriter toStringPretty: jsonMap).
		index = jsonObjects size ifFalse: [ writeStream << ',' << String cr ] ]."
	
	(NeoJSONWriter on: writeStream) nextPut: jsonObjects.

	writeStream close
]

{ #category : 'api - exporting' }
CoypuJSONExporter >> recorder: aRecorder [

	recorder := aRecorder
]
