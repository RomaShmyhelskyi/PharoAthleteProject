Class {
	#name : #TennisPlayer,
	#superclass : #Athlete,
	#instVars : [
		'worldRanking',
		'lastThreePrizeMoney'
	],
	#category : #'Project-Athlete'
}

{ #category : #comparing }
TennisPlayer >> < anAthlete [
	^ self salary < anAthlete salary
]

{ #category : #comparing }
TennisPlayer >> = anAthlete [
	^ self salary = anAthlete salary
]

{ #category : #comparing }
TennisPlayer >> > anAthlete [
	^ self salary > anAthlete salary
]

{ #category : #operations }
TennisPlayer >> addPrizeMoney: amount [
"Додає призові з нового турніру. Зберігає тільки останні 3 турніри"
	lastThreePrizeMoney addFirst: amount.
	lastThreePrizeMoney size > 3 ifTrue: [ 
		lastThreePrizeMoney removeLast 
	].
]

{ #category : #initialization }
TennisPlayer >> initialize [
	super initialize.
	worldRanking := 0.
	lastThreePrizeMoney := OrderedCollection new.
]

{ #category : #accessing }
TennisPlayer >> lastThreePrizeMoney [
	^ lastThreePrizeMoney
]

{ #category : #printing }
TennisPlayer >> printOn: aStream [
	"Виводить інформацію про тенісиста у читабельному форматі"
	aStream 
		nextPutAll: 'Тенісист: ';
		nextPutAll: surname;
		nextPutAll: ', вік: ';
		print: age;
		nextPutAll: ', громадянство: ';
		nextPutAll: citizenship;
		nextPutAll: ', рейтинг: ';
		print: worldRanking;
		nextPutAll: ', заробіток: ';
		print: self salary.
]

{ #category : #accessing }
TennisPlayer >> salary [
"Розраховує загальний заробіток як суму призових з трьох останніх турнірів"
	^ lastThreePrizeMoney 
		ifEmpty: [ 0 ]
		ifNotEmpty: [ lastThreePrizeMoney sum ]
]

{ #category : #accessing }
TennisPlayer >> worldRanking [
	^ worldRanking
]

{ #category : #accessing }
TennisPlayer >> worldRanking: anInteger [
	worldRanking := anInteger
]
