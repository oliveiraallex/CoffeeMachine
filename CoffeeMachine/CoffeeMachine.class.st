Class {
	#name : #CoffeeMachine,
	#superclass : #Object,
	#instVars : [
		'leds',
		'buttons',
		'machineStateListCodes'
	],
	#category : #CoffeeMachine
}

{ #category : #control }
CoffeeMachine >> brewCoffee: anInteger [
	| coffeeOption |
	coffeeOption := #coffee , anInteger asString.
	buttons pressButton: coffeeOption.
	^ 'brewing' , coffeeOption
]

{ #category : #initialization }
CoffeeMachine >> initialize [
	buttons := CMButtons new.
	leds := CMLeds new.
	machineStateListCodes := {(#'0000' -> 'powerOff').
	(#'0002' -> 'standBy').
	(#'2000' -> 'brewingCoffee1').
	(#'0200' -> 'brewingCoffee2').
	(#'0020' -> 'brewingCoffee3').
	(#'2220' -> 'preparing').
	(#'1110' -> 'ready')} asDictionary.
	self flag: 'refactor later'
]

{ #category : #state }
CoffeeMachine >> isOff [
	self machineState = 'powerOff'
		ifTrue: [ ^ true ]
		ifFalse: [ ^ false ]
]

{ #category : #state }
CoffeeMachine >> isOn [
	| machineState |
	machineState := self machineState.
	machineState = 'powerOff'
		ifTrue: [ ^ false ]
		ifFalse: [ machineState = 'standyBy'
				ifTrue: [ ^ false ]
				ifFalse: [ ^ true ] ]
]

{ #category : #state }
CoffeeMachine >> isReady [
	self machineState = 'ready'
		ifTrue: [ ^ true ]
		ifFalse: [ ^ false ]
]

{ #category : #testing }
CoffeeMachine >> isStandBy [
	self machineState = 'standBy'
		ifTrue: [ ^ true ]
		ifFalse: [ ^ false ]
]

{ #category : #control }
CoffeeMachine >> machineState [
	| machineStateCode |
	machineStateCode := self machineStateCode.
	^ machineStateListCodes
		at: machineStateCode
		ifAbsent: [ self error: 'State ' , machineStateCode asString , ' not found' ]
]

{ #category : #control }
CoffeeMachine >> machineStateCode [
	| ledsState machineStateCode |
	ledsState := leds ledsState.
	machineStateCode := (ledsState at: #coffee1) asString
		, (ledsState at: #coffee2) asString
		, (ledsState at: #coffee3) asString
		, (ledsState at: #power) asString.
	^ machineStateCode
]

{ #category : #control }
CoffeeMachine >> turnOff [
	"check machine state, if off try to turn on"
	self isStandBy ifTrue: [ ^ true ] ifFalse: [ buttons pressButton:#power. ^'turningOff' ]
]

{ #category : #control }
CoffeeMachine >> turnOn [
	"check machine state, if on try to turn off"
	self isReady ifTrue: [ ^ true ] ifFalse: [ buttons pressButton:#power. ^'turningOn' ] 
]
