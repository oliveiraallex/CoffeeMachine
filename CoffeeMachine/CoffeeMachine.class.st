Class {
	#name : #CoffeeMachine,
	#superclass : #Object,
	#instVars : [
		'lcdDisplay',
		'badgeReader',
		'distanceSensor',
		'leds',
		'buttons',
		'machineState'
	],
	#category : #CoffeeMachine
}

{ #category : #initialization }
CoffeeMachine >> initialize [ 
	lcdDisplay := CMLCD new.
	badgeReader := CMBadgeReader new.
	distanceSensor := CMDistanceSensor new.
	buttons := CMButtons new.
	leds := CMLeds new. 
	
	machineState :=
		{ #'0000' -> 'powerOff'.
		  #'0002' -> 'standyBy'.
		  #'2000' -> 'brewingCoffee1'.
		 } asDictionary .
]

{ #category : #state }
CoffeeMachine >> isOn [ 
   "read leds from the buttons"
	"if the machine is on"
	"tempIsOn := true."
	"^tempIsOn"
]

{ #category : #control }
CoffeeMachine >> machineState [
	
	| machineStateCode |
	
	machineStateCode := self machineStateCode.
	
		
	
	
	
	"
	^ self buttonState: 'coffee2'.	
	^ self buttonState: 'coffee3'.
	^ self buttonState: 'water'.
	^ self buttonState: 'coffee'.
	^ self buttonState: 'garbage'.
	^ self buttonState: 'error'.
	"
	^ machineState at: machineStateCode ifAbsent: [ self error: 'State ',machineStateCode asString,' not found' ]
]

{ #category : #control }
CoffeeMachine >> machineStateCode [
	
	|ledsState machineStateCode|
	
	ledsState := leds ledsState.
	machineStateCode := 
		(ledsState at:#coffee1)asString,
		(ledsState at:#coffee2) asString,
		(ledsState at:#coffee3) asString,
		(ledsState at:#power) asString.
	
	^ machineStateCode
	
	
	
	"
	^ self buttonState: 'coffee2'.	
	^ self buttonState: 'coffee3'.
	^ self buttonState: 'water'.
	^ self buttonState: 'coffee'.
	^ self buttonState: 'garbage'.
	^ self buttonState: 'error'.
	"
	
	
]

{ #category : #control }
CoffeeMachine >> turnOn [
	"check machine state"

	"press the power button"
	
	
	
	
	
	
	"[ (Delay forSeconds: 5) wait.
	  tempIsOn := true. ]forkNamed: 'turningMachineOn'."

	
]
