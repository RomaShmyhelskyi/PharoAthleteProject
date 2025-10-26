Class {
	#name : #FootballerTest,
	#superclass : #TestCase,
	#instVars : [
		'footballer'
	],
	#category : #'Project-Athlete-Tests'
}

{ #category : #running }
FootballerTest >> setUp [
    "Підготовка тестового футболіста перед кожним тестом"
    super setUp.
    footballer := Footballer new.
    footballer surname: 'Шевченко'.
    footballer age: 35.
    footballer citizenship: 'Україна'.
    footballer club: 'Динамо Київ'.
    footballer annualContract: 5000000.
    footballer goalsScored: 25
]

{ #category : #tests }
FootballerTest >> testAnnualContractAccessors [
    "Перевірка getter та setter для контракту"
    footballer annualContract: 10000000.
    self assert: footballer annualContract equals: 10000000
]

{ #category : #tests }
FootballerTest >> testCalculateIncomeWithGoals [
    "Перевірка розрахунку доходу з голами"
    | expectedIncome actualIncome |
    expectedIncome := 6250000.
    actualIncome := footballer calculateIncome.
    
    self assert: actualIncome equals: expectedIncome
]

{ #category : #tests }
FootballerTest >> testCalculateIncomeWithoutGoals [
    "Перевірка розрахунку доходу без голів"
    footballer goalsScored: 0.
    
    self assert: footballer calculateIncome equals: 5000000
]

{ #category : #tests }
FootballerTest >> testClubAccessors [
    "Перевірка getter та setter для клубу"
    footballer club: 'Шахтар Донецьк'.
    self assert: footballer club equals: 'Шахтар Донецьк'
]

{ #category : #tests }
FootballerTest >> testCompareIncomeWithEqualFootballer [
    "Порівняння з футболістом з рівним доходом"
    | equalFootballer |
    equalFootballer := Footballer new.
    equalFootballer annualContract: 5000000.
    equalFootballer goalsScored: 25.
    
    self assert: (footballer compareIncomeTo: equalFootballer) equals: 0
]

{ #category : #tests }
FootballerTest >> testGoalsScoredAccessors [
    "Перевірка getter та setter для забитих голів"
    footballer goalsScored: 30.
    self assert: footballer goalsScored equals: 30
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
