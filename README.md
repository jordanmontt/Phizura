# CoypuRecorder

A [Coypu](https://github.com/lucretiomsp/Coypu) recorder implementation using [MethodProxies](https://github.com/pharo-contributions/MethodProxies) as the backend of the instrumentation.

### How to install it

```Smalltalk
EpMonitor disableDuring: [
	Metacello new
		baseline: 'IllimaniProfiler';
		repository: 'github://jordanmontt/CoypuRecorder:main';
		load ].
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

Each time that one of those messages is send, the CoypuRecorder will capture the message and the time when the method was executed. After a performance is made, one can use the records to re-play the performance with he same delays.

This project depends on [Coypu](https://github.com/lucretiomsp/Coypu) and [MethodProxies](https://github.com/pharo-contributions/MethodProxies).