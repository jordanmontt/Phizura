Object subclass: #PhizuraUtils
    instanceVariableNames: ''
    classVariableNames: ''
    package: 'Phizura-Utils'.

PhizuraUtils class >> formatCommandString: aString [
    "Format a command string to ensure consistent casing and spacing"
    ^ aString asString
        trimmed
        capitalized
]

PhizuraUtils class >> formatBpmString: bpmValue [
    "Format a BPM value into a string with the appropriate unit"
    ^ (bpmValue printString) , ' bpm'
]

PhizuraUtils class >> formatTimestamp: aDateAndTime [
    "Format a timestamp in a consistent way for logging and filenames"
    ^ String streamContents: [ :stream |
        stream 
            << aDateAndTime monthAbbreviation
            << '-'.
        aDateAndTime dayOfMonth printOn: stream.
        stream << '-'.
        aDateAndTime hour24 printOn: stream.
        stream << 'h'.
        aDateAndTime minute printOn: stream.
        stream << 'm' ]
]

PhizuraUtils class >> formatMethodInvocation: aSelector withArguments: anArray [
    "Format a method invocation with its arguments consistently"
    ^ String streamContents: [ :stream |
        stream << aSelector.
        anArray ifNotEmpty: [ 
            stream << ' '.
            anArray size = 2
                ifTrue: [ stream << 'at: #' << anArray first << ' put: '.
                         anArray second printOn: stream ]
                ifFalse: [ stream << anArray first asString ]]]

PhizuraUtils class >> defaultReceiverString [
    "Returns the default receiver string used across handlers"
    ^ 'Performance uniqueInstance'

PhizuraUtils class >> formatRecordEntry: aRecordEntry [
    "Format a record entry consistently for display"
    ^ String streamContents: [ :stream |
        stream 
            << aRecordEntry receiver
            << ' '
            << aRecordEntry message ]
]