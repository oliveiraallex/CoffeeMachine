"
Extending PotGPIOPin class with state instance variable to catch the state of coffee machine leds. 

Store 3 states of led: 0 OFF, 1 ON, 2 flashing 

"
Class {
	#name : #CMLed,
	#superclass : #PotGPIOPin,
	#instVars : [
		'state'
	],
	#category : #CoffeeMachine
}

{ #category : #accessing }
CMLed >> state [
	^ state
]

{ #category : #accessing }
CMLed >> state: anInteger [
	state := anInteger
]
