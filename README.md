# Phizura

Phizura is a [Coypu](https://github.com/lucretiomsp/Coypu) recorder implementation using [MethodProxies](https://github.com/pharo-contributions/MethodProxies) as the instrumentation backend.
With MethodProxies Phizura instruments the necessary methods to capture all Playground evaluations and key strokes.
This is useful for music performances. The artist, the one using Coypu to make music, can perform and all the code evaluations will be recorder. 
After, phizura generates readable code, identical of the one being performed, and allows to replay the music performance with the **exact** times and delays.

MethodProxies is being used to have a clean implementation. NO COYPU CODE IS AFFECTED thanks to MethodProxies architecture.

### How to install it

```Smalltalk
Metacello new
	baseline: 'Phizura';
	repository: 'github://jordanmontt/Phizura:main';
	load.
```

### How to use it

#### Option 1, using th ePhizura Playground

Phizura comes with its own Playground. You can open it by clicking on the button. Then, to start and stop the recording you only need to click the Playground buttons.

<img width="574" height="185" alt="Capture d’écran 2025-12-02 à 22 48 08" src="https://github.com/user-attachments/assets/db5c3bab-c9c0-44d9-86f1-441d2b0c58a0" />

#### Option 2, programatically

You can use Phizura programatically. For that, you need to run the below code.
Keep in mind that for capturing the key strokes you need to use the Phizura Playground.

```Smalltalk
recorder := PhizuraRecorder new.
recorder record. "start recording"

"Coypu code here"

recorder stopRecording. "stop recording"

"To see the generated code"
recorder emitCode.

```

### Implementation details

Phizura instruments the evaluation method in the Playground. That means that each evaluation will be recorded (only one you start phizura with `recorder record`).
Phizura also captures all key strokes that are pressed in the Phizura Playground.

After a performance is made, one can use the records to re-play the performance with he same delays.

This project depends on [Coypu](https://github.com/lucretiomsp/Coypu) and [MethodProxies](https://github.com/pharo-contributions/MethodProxies).
