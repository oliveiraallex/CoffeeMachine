Class {
	#name : #CMBadgeReader,
	#superclass : #Object,
	#category : #CoffeeMachine
}

{ #category : #initialization }
CMBadgeReader >> initialize [
	"initialize the badge class"
	"create a process waiting to read the badge"
	"when read it, check the database the user and credits"
	"if it is ok, set tempAuthenticated to true"
	"stop the process to read the badge"
	
]
