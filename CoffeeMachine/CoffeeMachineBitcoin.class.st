Class {
	#name : #CoffeeMachineBitcoin,
	#superclass : #Object,
	#instVars : [
		'coffeeMachine',
		'paymentProcess',
		'monitorProcess',
		'value'
	],
	#category : #CoffeeMachine
}

{ #category : #initalize }
CoffeeMachineBitcoin >> bitcoinWallet [
	^ '1DN8JRxunRtQwssr7sFJAfwr5ogEuZMV89'
]

{ #category : #actions }
CoffeeMachineBitcoin >> connectWaitValue [
	| webSocket response json |
	value := nil.
	[ webSocket := ZnWebSocket to: 'wss://ws.blockchain.info/inv'.
	response := [ webSocket
		sendMessage: '{"op":"addr_sub", "addr":"' , self bitcoinWallet , '"}';
		readMessage ]
		ensure: [ webSocket close ] ]
		on: Error
		do: [ Transcript
				show: 'Error in Coffee Machine Bitcoin: Waiting value';
				cr ].
	json := NeoJSONReader fromString: response.
	value := (((json at: 'x') at: 'out') at: 1) at: 'value'
]

{ #category : #initalize }
CoffeeMachineBitcoin >> initialize [ 
	coffeeMachine := CoffeeMachine new.
	
]

{ #category : #controls }
CoffeeMachineBitcoin >> monitor [
	paymentProcess := [
		self connectWaitValue. 
		self releaseCoffee.
	] forkNamed: 'paymentProcess'
]

{ #category : #controls }
CoffeeMachineBitcoin >> monitorStart [
	monitorProcess := [ 
		[ self monitor.
 	(Delay forSeconds: 30) wait.
		paymentProcess terminate] repeat  ]forkNamed: 'monitorProcess'. 
		
		 
]

{ #category : #controls }
CoffeeMachineBitcoin >> monitorStop [
	paymentProcess terminate.
	monitorProcess terminate
]

{ #category : #actions }
CoffeeMachineBitcoin >> releaseCoffee [
	[ value
		ifNotNil: [ coffeeMachine brewCoffee: 2.
			Transcript
				show: 'Payment received: ' , value asString;
				cr ] ]
		on: Error
		do: [ Transcript
				show: 'Error in Coffee Machine Bitcoin: Release coffee';
				cr ]
]
