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
	footballer1 := Footballer
		               newWithSurname: 'Альварез'
		               age: 26
		               citizenship: 'Мексика'
		               club: 'Сан Хосе'
		               annualContract: 136000
		               goalsScored: 3.

	footballer2 := Footballer
		               newWithSurname: 'Шевченко'
		               age: 21
		               citizenship: 'Україна'
		               club: 'Шахтар'
		               annualContract: 753000
		               goalsScored: 3.

	"Створення тестового тенісиста"
	tennisPlayer1 := TennisPlayer
		                 newWithSurname: 'Світоліна'
		                 age: 28
		                 citizenship: 'Україна'
		                 worldRanking: 15
		                 lastThreePrizeMoney: #( 500000 600000 700000 )
]

{ #category : #'tests - adding' }
AthleteContainerTest >> testAdd [
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

{ #category : #'tests - accessing' }
AthleteContainerTest >> testFindRichestAthlete [

	container
		add: footballer1;
		add: footballer2;
		add: tennisPlayer1.

	self assert: tennisPlayer1 equals: container findRichestAthlete
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
