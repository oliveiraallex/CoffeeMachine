Class {
	#name : #CMButtons,
	#superclass : #Object,
	#instVars : [
		'buttonDic'
	],
	#category : #CoffeeMachine
}

{ #category : #initialization }
CMButtons >> buttons [
	^ buttonDic
]

{ #category : #initialization }
CMButtons >> initialize [
	buttonDic := Dictionary new.
	buttonDic 
		add: (#coffee1 -> (PotGPIOPin id: 23 number: 4));
		add: (#coffee2 -> (PotGPIOPin id: 24 number: 5));
		add: (#coffee3 -> (PotGPIOPin id: 25 number: 6));
		add: (#power -> (PotGPIOPin id: 4 number: 7)).
	buttonDic
		do: [ :item | 
			item
				board: RpiBoard3B current;
				beDigitalInput].
]

{ #category : #initialization }
CMButtons >> pressButton: aSymbol [
	| button |
	button := buttonDic at: aSymbol.
	[ button beDigitalOutput.
	(Delay forSeconds: 0.5) wait.
	button beDigitalInput ] forkNamed: 'pressButton' , aSymbol
]
