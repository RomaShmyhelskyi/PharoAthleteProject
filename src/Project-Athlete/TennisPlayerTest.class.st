Class {
	#name : #TennisPlayerTest,
	#superclass : #TestCase,
	#instVars : [
		'player'
	],
	#category : #'Project-Athlete-Tests'
}

{ #category : #running }
TennisPlayerTest >> setUp [
	super setUp.
	player := TennisPlayer new.
]

{ #category : #running }
TennisPlayerTest >> tearDown [
"Відбувається очищення після кожного тесту"
	player := nil.
	super tearDown.
]

{ #category : #tests }
TennisPlayerTest >> testAddMultiplePrizeMoney [
"Перевіряє додавання декількох призів"
	player addPrizeMoney: 30000.
	player addPrizeMoney: 50000.
	player addPrizeMoney: 70000.
	
	self assert: player lastThreePrizeMoney size equals: 3.
	self assert: player lastThreePrizeMoney first equals: 70000.
	self assert: player lastThreePrizeMoney last equals: 30000.
]

{ #category : #tests }
TennisPlayerTest >> testAddSinglePrizeMoney [
"Перевіряє додавання одного призу"
	player addPrizeMoney: 50000.
	self assert: player lastThreePrizeMoney size equals: 1.
	self assert: player lastThreePrizeMoney first equals: 50000.
]

{ #category : #tests }
TennisPlayerTest >> testCompareEquals [
"Перевіряє оператор = для порівняння"
	| player2 |
	player addPrizeMoney: 75000.
	
	player2 := TennisPlayer new.
	player2 addPrizeMoney: 75000.
	
	self assert: (player = player2).
]

{ #category : #tests }
TennisPlayerTest >> testCompareGreaterThan [
"Перевіряє оператор > для порівняння"
	| player2 |
	player addPrizeMoney: 100000.
	
	player2 := TennisPlayer new.
	player2 addPrizeMoney: 50000.
	
	self assert: (player > player2).
	self deny: (player2 > player).
]

{ #category : #tests }
TennisPlayerTest >> testCompareLessThan [
"Перевіряє оператор < для порівняння"
	| player2 |
	player addPrizeMoney: 50000.
	
	player2 := TennisPlayer new.
	player2 addPrizeMoney: 100000.
	
	self assert: (player < player2).
	self deny: (player2 < player).
]

{ #category : #tests }
TennisPlayerTest >> testInitialize [
"Перевіряє початкову ініціалізацію тенісиста"
	self assert: player surname equals: ''.
	self assert: player age equals: 0.
	self assert: player citizenship equals: ''.
	self assert: player worldRanking equals: 0.
	self assert: player lastThreePrizeMoney isEmpty.
]

{ #category : #tests }
TennisPlayerTest >> testKeepOnlyLastThreePrizes [
"Перевіряє що зберігаються тільки останні 3 призи"
	player addPrizeMoney: 10000.
	player addPrizeMoney: 20000.
	player addPrizeMoney: 30000.
	player addPrizeMoney: 40000.
	player addPrizeMoney: 50000.
	
	self assert: player lastThreePrizeMoney size equals: 3.
	self assert: player lastThreePrizeMoney first equals: 50000.
	self assert: player lastThreePrizeMoney last equals: 30000.
	self deny: (player lastThreePrizeMoney includes: 10000).
	self deny: (player lastThreePrizeMoney includes: 20000).
]

{ #category : #tests }
TennisPlayerTest >> testSetAge [
"Перевіряє встановлення віку"
	player age: 35.
	self assert: player age equals: 35.
]

{ #category : #tests }
TennisPlayerTest >> testSetCitizenship [
"Перевіряє встановлення громадянства"
	player citizenship: 'Швейцарія'.
	self assert: player citizenship equals: 'Швейцарія'.
]

{ #category : #tests }
TennisPlayerTest >> testSetSurname [
"Перевіряє встановлення прізвища"
	player surname: 'Федерер'.
	self assert: player surname equals: 'Федерер'.
]

{ #category : #tests }
TennisPlayerTest >> testSetWorldRanking [
"Перевіряє встановлення світового рейтингу"
	player worldRanking: 10.
	self assert: player worldRanking equals: 10.
]
