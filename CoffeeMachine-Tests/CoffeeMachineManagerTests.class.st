Class {
	#name : #CoffeeMachineManagerTests,
	#superclass : #TestCase,
	#category : #'CoffeeMachine-Tests'
}

{ #category : #tests }
CoffeeMachineManagerTests >> testInitialize [ 
	| coffeeMachineManager |
	coffeeMachineManager := CoffeeMachineManager new.
	self assert: coffeeMachineManager isNotNil
]
