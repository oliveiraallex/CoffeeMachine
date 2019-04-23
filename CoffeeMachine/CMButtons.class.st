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
		add: (#coffee1 -> (PotGPIOPin id: 17 number: 0));
		add: (#coffee2 -> (PotGPIOPin id: 17 number: 0));
		add: (#coffee3 -> (PotGPIOPin id: 17 number: 0));
		add: (#power -> (PotGPIOPin id: 17 number: 0)).
	buttonDic
		do: [ :item | 
			item
				board: RpiBoard3B dummy;
				beDigitalOutput;
				value: 0 ].
]
