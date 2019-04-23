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
	coffeeMachine := CoffeeMachine new
	
]

{ #category : #initialization }
CoffeeMachineManager >> start [
	[ "waiting for badge"
		tempAuthenticated whileFalse: [ (Delay forSeconds: 1) wait ].
		
		tempIsOn whileFalse:  [ self turnOn ].
		
		
		
		
		
		
		coffeeMachine isOn 
			ifFalse: [ 
				| tries |
				coffeeMachine turnOn.
				tries := 0.
				[(coffeeMachine isOn not) and: [ tries < 10 ]] 
					whileTrue: [
						tries := tries + 1. 
						(Delay forSeconds: 1) wait.
						Transcript show: 'waiting...';cr. ]
				 ].
			
			(coffeeMachine isOn) 
				ifTrue: [  ] 
				ifFalse: [  ].
			
			    Transcript show: 'Coffee machine is ', coffeeMachine isOn asString.
	 ] forkNamed: 'CoffeeMachineManagerMain'
]
