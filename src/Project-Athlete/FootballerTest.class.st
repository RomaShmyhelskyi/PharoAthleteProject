Class {
	#name : #FootballerTest,
	#superclass : #TestCase,
	#instVars : [
		'f1',
		'f2',
		'f3'
	],
	#category : #'Project-Athlete-Tests'
}

{ #category : #running }
FootballerTest >> setUp [
	"Підготовка тестового футболіста перед кожним тестом"

	super setUp.
	f1 := Footballer
		      newWithSurname: 'Шевченко'
		      age: 35
		      citizenship: 'Україна'
		      club: 'Динамо Київ'
		      annualContract: 120500
		      goalsScored: 25.

	f2 := Footballer
		      newWithSurname: 'Ярмоленко'
		      age: 35
		      citizenship: 'Україна'
		      club: 'Динамо Київ'
		      annualContract: 63520
		      goalsScored: 0.

	f3 := Footballer
		      newWithSurname: 'Коноплянка'
		      age: 34
		      citizenship: 'Україна'
		      club: 'Збірна'
		      annualContract: 100000
		      goalsScored: 2
]

{ #category : #tests }
FootballerTest >> testAnnualContractAccessors [
	"Перевірка getter та setter для контракту"

	f1 annualContract: 10000000.
	self assert: f1 annualContract equals: 10000000
]

{ #category : #tests }
FootballerTest >> testClubAccessors [
	"Перевірка getter та setter для клубу"

	f1 club: 'Шахтар Донецьк'.
	self assert: f1 club equals: 'Шахтар Донецьк'
]

{ #category : #tests }
FootballerTest >> testEquality [
	"Порівняння з футболістом з рівним доходом"

	| equalFootballer |
	equalFootballer := Footballer new.
	equalFootballer annualContract: 120500.
	equalFootballer goalsScored: 25.

	self assert: f1 = equalFootballer
]

{ #category : #tests }
FootballerTest >> testGoalsScoredAccessors [
	"Перевірка getter та setter для забитих голів"

	f1 goalsScored: 30.
	self assert: f1 goalsScored equals: 30
]

{ #category : #tests }
FootballerTest >> testGreaterThan [

	self assert: f1 > f2
]

{ #category : #tests }
FootballerTest >> testInitialize [
    "Перевірка правильної ініціалізації футболіста"
    | newFootballer |
    newFootballer := Footballer new.
    
    self assert: newFootballer club equals: ''.
    self assert: newFootballer annualContract equals: 0.
    self assert: newFootballer goalsScored equals: 0
]

{ #category : #tests }
FootballerTest >> testLessThan [

	self assert: f2 < f1
]

{ #category : #tests }
FootballerTest >> testNewWithParameters [

	| f1 |
	f1 := Footballer
		      newWithSurname: 'Alvarez'
		      age: 20
		      citizenship: 'Mexican'
		      club: 'San Jose'
		      annualContract: 100000
		      goalsScored: 3.

	self assert: f1 surname equals: 'Alvarez'.
	self assert: f1 age equals: 20.
	self assert: f1 citizenship equals: 'Mexican'.
	self assert: f1 club equals: 'San Jose'.
	self assert: f1 annualContract equals: 100000.
	self assert: f1 goalsScored equals: 3
]

{ #category : #tests }
FootballerTest >> testSalary [
	"Перевірка розрахунку доходу з голами"

	"Розмір контракту футболіста f3 становить 100000, а кількість забитих голів -- 2.
	Отже, його зарплатня має становити 102000"

	| expectedSalary actualSalary |
	expectedSalary := 102000.
	actualSalary := f3 salary.
	self assert: actualSalary equals: expectedSalary
]
