Class {
	#name : #CoffeeMachineDelegate,
	#superclass : #ZnDefaultServerDelegate,
	#instVars : [
		'coffeeMachineController'
	],
	#category : #'CoffeeMachine-Server'
}

{ #category : #control }
CoffeeMachineDelegate >> brewCoffee [
	coffeeMachineController brewCoffee: 3
]

{ #category : #control }
CoffeeMachineDelegate >> brewEspresso [
	coffeeMachineController brewCoffee: 1
]

{ #category : #control }
CoffeeMachineDelegate >> brewEspressoLungo [
	coffeeMachineController brewCoffee: 2
]

{ #category : #initalization }
CoffeeMachineDelegate >> coffeeMachine: aCoffeeMachine [
	coffeeMachineController := aCoffeeMachine
]

{ #category : #initalization }
CoffeeMachineDelegate >> handleRequest: aRequest [
	self perform: aRequest uri lastPathSegment asSymbol.
	^ ZnResponse ok: aRequest uri
]
