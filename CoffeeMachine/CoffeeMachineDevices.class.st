Class {
	#name : #CoffeeMachineDevices,
	#superclass : #CoffeeMachine,
	#instVars : [
		'lcdDisplay',
		'badgeReader',
		'distanceSensor'
	],
	#category : #CoffeeMachine
}

{ #category : #initialization }
CoffeeMachineDevices >> initialize [
	lcdDisplay := CMLCD new.
	badgeReader := CMBadgeReader new.
	distanceSensor := CMDistanceSensor new
]
