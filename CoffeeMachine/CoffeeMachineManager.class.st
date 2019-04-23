Class {
	#name : #CoffeeMachineManager,
	#superclass : #Object,
	#instVars : [
		'coffeeMachine'
	],
	#category : #CoffeeMachine
}

{ #category : #initialization }
CoffeeMachineManager >> initialize [
	coffeeMachine := CoffeeMachineDevices new
	
]

{ #category : #state }
CoffeeMachineManager >> putReady [
	coffeeMachine isOff
		ifFalse: [ coffeeMachine isReady
				whileFalse: [ coffeeMachine isOn whileFalse: [ coffeeMachine turnOn ] ] ]
		ifTrue: [ ^ 'powerOff' ]
]

{ #category : #initialization }
CoffeeMachineManager >> start [
	[ "waiting for badge"
		"authenticated whileFalse: [ (Delay forSeconds: 1) wait ]."
		
		self putReady.
		
		coffeeMachine brewCoffee: 2. 
		
		
		
	 ] forkNamed: 'CoffeeMachineManagerMain'
]
