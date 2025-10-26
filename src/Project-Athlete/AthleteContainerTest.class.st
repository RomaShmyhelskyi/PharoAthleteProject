Class {
	#name : #AthleteContainerTest,
	#superclass : #TestCase,
	#instVars : [
		'container',
		'footballer1',
		'footballer2',
		'tennisPlayer1'
	],
	#category : #'Project-Athlete-Tests'
}

{ #category : #running }
AthleteContainerTest >> setUp [
    "Підготовка тестових даних перед кожним тестом"
    super setUp.
    
    container := AthleteContainer new.
    
    "Створення тестових футболістів"
    footballer1 := Footballer new.
    footballer1 surname: 'Шевченко'.
    footballer1 age: 35.
    footballer1 citizenship: 'Україна'.
    footballer1 club: 'Динамо Київ'.
    footballer1 annualContract: 5000000.
    footballer1 goalsScored: 25.
    
    footballer2 := Footballer new.
    footballer2 surname: 'Ronaldo'.
    footballer2 age: 38.
    footballer2 citizenship: 'Португалія'.
    footballer2 club: 'Al Nassr'.
    footballer2 annualContract: 20000000.
    footballer2 goalsScored: 30.
    
    "Створення тестового тенісиста"
    tennisPlayer1 := TennisPlayer new.
    tennisPlayer1 surname: 'Світоліна'.
    tennisPlayer1 age: 28.
    tennisPlayer1 citizenship: 'Україна'.
    tennisPlayer1 worldRanking: 15.
    tennisPlayer1 lastThreePrizeMoney: #(500000 600000 700000)
]

{ #category : #'tests - adding' }
AthleteContainerTest >> testAddAthlete [
    "Перевірка додавання одного спортсмена"
    container add: footballer1.
    
    self assert: container size equals: 1.
    self assert: (container athletes includes: footballer1)
]

{ #category : #'tests - adding' }
AthleteContainerTest >> testAddFootballerWithParameters [
    "Перевірка програмного додавання футболіста"
    container 
        addFootballerWithSurname: 'Ярмоленко' 
        age: 32 
        citizenship: 'Україна' 
        club: 'Динамо Київ' 
        annualContract: 3000000 
        goalsScored: 15.
    
    self assert: container size equals: 1.
    self assert: container athletes first surname equals: 'Ярмоленко'.
    self assert: container athletes first annualContract equals: 3000000.
]

{ #category : #'tests - adding' }
AthleteContainerTest >> testAddMultipleAthletes [
    "Перевірка додавання кількох спортсменів"
    container add: footballer1.
    container add: footballer2.
    container add: tennisPlayer1.
    
    self assert: container size equals: 3.
    self assert: (container athletes includes: footballer1).
    self assert: (container athletes includes: footballer2).
    self assert: (container athletes includes: tennisPlayer1)
]

{ #category : #'tests - accessing' }
AthleteContainerTest >> testAthletes [
    "Перевірка доступу до колекції спортсменів"
    container add: footballer1.
    container add: tennisPlayer1.
    
    self assert: container athletes size equals: 2.
    self assert: (container athletes isKindOf: OrderedCollection)
]

{ #category : #'tests - initialization' }
AthleteContainerTest >> testInitialize [
    "Перевірка ініціалізації порожнього контейнера"
    | newContainer |
    newContainer := AthleteContainer new.
    
    self assert: newContainer size equals: 0.
    self assert: newContainer athletes isEmpty
]

{ #category : #'tests - accessing' }
AthleteContainerTest >> testSize [
    "Перевірка методу size"
    self assert: container size equals: 0.
    
    container add: footballer1.
    self assert: container size equals: 1.
    
    container add: footballer2.
    self assert: container size equals: 2
]
