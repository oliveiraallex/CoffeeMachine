Class {
	#name : #CoffeeMachineServer,
	#superclass : #Object,
	#instVars : [
		'znServer',
		'coffeeMachine'
	],
	#category : #'CoffeeMachine-Server'
}

{ #category : #initialization }
CoffeeMachineServer >> initialize [
	| delegate |
	delegate := CoffeeMachineDelegate new.
	delegate coffeeMachine: CoffeeMachine new.
	znServer := ZnSingleThreadedServer defaultOn: 8080.
	znServer delegate: delegate.
	
]

{ #category : #initialization }
CoffeeMachineServer >> start [
	znServer start
]

{ #category : #initialization }
CoffeeMachineServer >> stop [
	znServer stop
]
