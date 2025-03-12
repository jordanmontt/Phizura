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