Class {
	#name : #AthleteTest,
	#superclass : #TestCase,
	#category : #'Project-Athlete'
}

{ #category : #tests }
AthleteTest >> testAge [

	| a |
	a := Athlete new.
	a age: 17.
	self assert: a age equals: 17
]

{ #category : #tests }
AthleteTest >> testCitizenship [

	| a |
	a := Athlete new.
	a citizenship: 'UA'.
	self assert: a citizenship equals: 'UA'
]

{ #category : #tests }
AthleteTest >> testInitialize [

	| a |
	a := Athlete new.
	self assert: a surname equals: ''.
	self assert: a age equals: 0.
	self assert: a citizenship equals: ''
]

{ #category : #tests }
AthleteTest >> testSurname [

	| a |
	a := Athlete new.
	a surname: 'Jensen'.
	self assert: a surname equals: 'Jensen'
]
