# Phizura

Phizura is a [Coypu](https://github.com/lucretiomsp/Coypu) recorder implementation using [MethodProxies](https://github.com/pharo-contributions/MethodProxies) as the instrumentation backend.

### How to install it

```Smalltalk
Metacello new
	baseline: 'PhizuraRecorder';
	repository: 'github://jordanmontt/Phizura:main';
	load.
```

### How to use it

```Smalltalk
recorder := PhizuraRecorder new.
recorder record "start recording".

"Coypu code here"

recorder unrecord "stop recording".

"To import the records as a JSON"
recorder exportAsJSON.
```

### Implementation details

Method that are captured:

```Smalltalk
Performance >> #activeDSP:.
Performance >> #freq:.
Performance class >> #uniqueInstanchandler.
Performance >> #performer.
Performance >> #at:puhandler.
Performance >> #mute:.
Performance >> #muteAll.
Performance >> #solo:.
Performance >> #play.
Performance >> #stop.
```

Each time that one of those messages is send, Phizura will capture the message and the time when the method was executed. After a performance is made, one can use the records to re-play the performance with he same delays.

This project depends on [Coypu](https://github.com/lucretiomsp/Coypu) and [MethodProxies](https://github.com/pharo-contributions/MethodProxies).
