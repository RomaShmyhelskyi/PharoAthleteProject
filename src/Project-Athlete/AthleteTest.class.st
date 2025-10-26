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
AthleteTest >> testEqualityWithDifferentValues [

	| a1 a2 |
	a1 := Athlete
		      newWithSurname: 'Messi'
		      age: 22
		      citizenship: 'UA'
		      salary: 23.
	a2 := Athlete
		      newWithSurname: 'Messi'
		      age: 22
		      citizenship: 'UA'
		      salary: 35.
	self deny: a1 equals: a2
]

{ #category : #tests }
AthleteTest >> testEqualityWithSameValues [

	| a1 a2 |
	a1 := Athlete
		      newWithSurname: 'Messi'
		      age: 22
		      citizenship: 'UA'
		      salary: 23.
	a2 := Athlete
		      newWithSurname: 'Messi'
		      age: 22
		      citizenship: 'UA'
		      salary: 23.
	self assert: a1 equals: a2
]

{ #category : #tests }
AthleteTest >> testGreaterEqualThan [

	| a1 a2 a3 |
	a1 := Athlete
		      newWithSurname: 'Messi'
		      age: 22
		      citizenship: 'UA'
		      salary: 7.
	a2 := Athlete
		      newWithSurname: 'Messi'
		      age: 22
		      citizenship: 'UA'
		      salary: 4.
	a3 := Athlete
		      newWithSurname: 'Messi'
		      age: 22
		      citizenship: 'UA'
		      salary: 4.
	self assert: a1 >= a2.
	self deny: a2 >= a1.
	self assert: a2 >= a3
]

{ #category : #tests }
AthleteTest >> testInitialize [

	| a |
	a := Athlete new.
	self assert: a surname equals: ''.
	self assert: a age equals: 0.
	self assert: a citizenship equals: ''.
	self assert: a salary equals: 0
]

{ #category : #tests }
AthleteTest >> testLessEqualThan [

	| a1 a2 a3 |
	a1 := Athlete
		      newWithSurname: 'Messi'
		      age: 22
		      citizenship: 'UA'
		      salary: 23.
	a2 := Athlete
		      newWithSurname: 'Messi'
		      age: 22
		      citizenship: 'UA'
		      salary: 35.
	a3 := Athlete
		      newWithSurname: 'Messi'
		      age: 22
		      citizenship: 'UA'
		      salary: 35.
	self assert: a1 <= a2.
	self deny: a2 <= a1.
	self assert: a2 <= a3
]

{ #category : #tests }
AthleteTest >> testLessThan [

	| a1 a2 |
	a1 := Athlete
		      newWithSurname: 'Messi'
		      age: 22
		      citizenship: 'UA'
		      salary: 23.
	a2 := Athlete
		      newWithSurname: 'Messi'
		      age: 22
		      citizenship: 'UA'
		      salary: 35.
	self assert: a1 < a2.
	self deny: a2 < a1
]

{ #category : #tests }
AthleteTest >> testSalary [

	| a |
	a := Athlete new.
	a salary: 7.
	self assert: a salary equals: 7
]

{ #category : #tests }
AthleteTest >> testSurname [

	| a |
	a := Athlete new.
	a surname: 'Jensen'.
	self assert: a surname equals: 'Jensen'
]
