Class {
	#name : #CoffeeMachineTests,
	#superclass : #TestCase,
	#category : #'CoffeeMachine-Tests'
}

{ #category : #tests }
CoffeeMachineTests >> testInitializeCoffeeMachine [
	| coffeeMachine |
	coffeeMachine := CoffeeMachine   new.
	self assert: coffeeMachine isNotNil
]
