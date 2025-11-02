"
""
Я представляю професійного тенісиста з його рейтингом та призовими з турнірів.

Обов'язки:
Я відстежую світовий рейтинг тенісиста та зберігаю його призові з останніх трьох турнірів. Я розраховую загальний заробіток як суму цих трьох останніх призів. Я можу порівнювати себе з іншими спортсменами за величиною заробітку.

Співробітники:
Я успадковую від Athlete, який надає базову особисту інформацію (прізвище, вік, громадянство). Я співпрацюю з OrderedCollection для зберігання та управління останніми трьома сумами призових, автоматично видаляючи старіші призи при додаванні нових.

Публічний API та ключові повідомлення:
- worldRanking: anInteger - встановлює світовий рейтинг гравця
- addPrizeMoney: amount - додає призові гроші з турніру
- salary - повертає загальний заробіток з останніх трьох турнірів
- Як створити екземпляр:
    player := TennisPlayer new.
    player surname: 'Свитоліна'; age: 29; citizenship: 'Україна'.
    player worldRanking: 27.
    player addPrizeMoney: 100000.

Приклад:
    tennis := TennisPlayer new.
    tennis surname: 'Федерер'.
    tennis worldRanking: 1.
    tennis addPrizeMoney: 500000.
    tennis addPrizeMoney: 750000.
    tennis addPrizeMoney: 1000000.
    tennis salary. ""повертає 2250000""

Внутрішнє представлення та ключові моменти реалізації:

Змінні екземпляра:
    worldRanking: <Integer> - позиція гравця у світовому тенісному рейтингу
    lastThreePrizeMoney: <OrderedCollection> - зберігає призові з трьох останніх турнірів

Моменти реалізації:
Колекція lastThreePrizeMoney використовує addFirst: для додавання нових призів на початок, забезпечуючи що найсвіжіший турнір завжди перший. Коли додається четвертий приз, removeLast автоматично видаляє найстаріший, підтримуючи рівно три записи. Розрахунок salary використовує ifEmpty:ifNotEmpty: для безпечної обробки випадків, коли ще не зіграно жодного турніру, повертаючи 0 замість помилки.
""
"
Class {
	#name : #TennisPlayer,
	#superclass : #Athlete,
	#instVars : [
		'worldRanking',
		'lastThreePrizeMoney'
	],
	#category : #'Project-Athlete'
}

{ #category : #operations }
TennisPlayer >> addPrizeMoney: amount [
	"Додає призові з нового турніру. Зберігає тільки останні 3 турніри"

	amount isNumber
		ifTrue: [
			amount > 0
				ifTrue: [
					lastThreePrizeMoney addFirst: amount.
					lastThreePrizeMoney removeLast ]
				ifFalse: [ self error: 'Хибне значення: ' , amount ] ]
		ifFalse: [
			self error:
				'Недопустиме значення призових з останнього турніру: ' , amount ]
]

{ #category : #calculating }
TennisPlayer >> calculateIncome [
    "Розраховує дохід тенісиста - делегує до salary"
    ^ self salary
]

{ #category : #initialization }
TennisPlayer >> initialize [

	super initialize.
	worldRanking := 0.
	lastThreePrizeMoney := OrderedCollection new: 3
]

{ #category : #accessing }
TennisPlayer >> lastThreePrizeMoney [
	^ lastThreePrizeMoney
]

{ #category : #accessing }
TennisPlayer >> lastThreePrizeMoney: aCollection [
	"Встановлює призові за останні три турніри"

	lastThreePrizeMoney := aCollection
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

	anInteger isInteger
		ifTrue: [
			anInteger > 0
				ifTrue: [ worldRanking := anInteger ]
				ifFalse: [ self error: 'Хибне значення рейтингу: ' , anInteger ] ]
		ifFalse: [
		self error: 'Недопустиме значення рейтингу: ' , anInteger ]
]
