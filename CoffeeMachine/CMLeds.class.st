Class {
	#name : #CMLeds,
	#superclass : #Object,
	#instVars : [
		'ledDic'
	],
	#category : #CoffeeMachine
}

{ #category : #initialization }
CMLeds >> initialize [
	
	ledDic := Dictionary new.		
	ledDic 
		add: (#coffee1 -> ((CMLed id: 17 number: 0) state: 0));
		add: (#coffee2 -> ((CMLed id: 17 number: 0) state: 0));
		add: (#coffee3 -> ((CMLed id: 17 number: 0) state: 0));
		add: (#power -> ((CMLed id: 17 number: 0)state: 0)).
	ledDic
		do: [ :item | 
			item
				board: RpiBoard3B dummy;
				beDigitalInput ].
]

{ #category : #control }
CMLeds >> ledStateGet: aSymbol [
	"get one of 3 states of led: 0 OFF, 1 ON, 2 flashing"

	^ (ledDic at: aSymbol) state
	
]

{ #category : #control }
CMLeds >> ledStateSet: aSymbol [
	"check 3 states of led: 0 OFF, 1 ON, 2 flashing 
	If the state stay in 0: the state is OFF, if stay in 1: the state is ON or if the state change: the state is flashing"
		
	|stateValue led|
	led := (ledDic at: aSymbol).
	stateValue := led value.
	[1 to: 8 do: [ :i | 
		(stateValue = led value) ifFalse: [  stateValue := 2 ].
		(Delay forSeconds: 0.2) wait 
	].
stateValue := 2.
	led state: stateValue.
	] forkNamed: 'ledStateSet',aSymbol

	
]

{ #category : #control }
CMLeds >> ledsState [
	"check 3 states of led: 0 OFF, 1 ON, 2 flashing 
	If the state stay in 0: the state is OFF, if stay in 1: the state is ON or if the state change: the state is flashing"
	
	self ledStateSet: #coffee1.
	self ledStateSet: #coffee2.
	self ledStateSet: #coffee3.
	self ledStateSet: #power.
	
	(Delay forSeconds: 2) wait.
	^ ledDic collect: #state
]
