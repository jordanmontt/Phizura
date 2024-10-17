Extension { #name : 'MpMethodProxy' }

{ #category : '*MpCoypuRecorder' }
MpMethodProxy class >> coypuOnMethod: aMethod handlerClass: aHandlerClass [

	^ self new
		  proxyMethod: aMethod;
		  handler: (aHandlerClass new
				   instrumentedMethod: aMethod;
				   yourself);
		  yourself
]
