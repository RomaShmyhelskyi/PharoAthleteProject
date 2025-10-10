Class {
	#name : #AthleteTest,
	#superclass : #TestCase,
	#category : #'Project-Athlete'
}

{ #category : #tests }
AthleteTest >> testInitialize [

	| a |
	a := Athlete new.
	self assert: a surname equals: ''.
	self assert: a age equals: 0.
	self assert: a citizenship equals: ''.
	self assert: a salary equals: 0
]
