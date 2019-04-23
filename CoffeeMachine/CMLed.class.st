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
