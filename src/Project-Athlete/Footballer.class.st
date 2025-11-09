"
Я представляю футболіста в системі управління спортсменами.

Я є спеціалізованим типом спортсмена (Athlete) з додатковими атрибутами, специфічними для футболу:
- club: назва футбольного клубу, в якому я граю
- annualContract: розмір мого річного контракту в грошових одиницях
- goalsScored: кількість голів, які я забив за рік

Мій дохід розраховується як мій річний контракт плюс бонус 1% за кожен забитий гол.

Приклад використання:
    footballer := Footballer new.
    footballer surname: 'Шевченко'.
    footballer age: 35.
    footballer citizenship: 'Україна'.
    footballer club: 'Динамо Київ'.
    footballer annualContract: 5000000.
    footballer goalsScored: 25.
    footballer calculateIncome. ""повертає 6250000""

Мене можна порівнювати з іншими спортсменами за доходом, використовуючи метод #compareIncomeTo:

Змінні екземпляра:
    club            <String>    Назва футбольного клубу
    annualContract  <Number>    Розмір річного контракту
    goalsScored     <Number>    Кількість забитих голів за рік
"
Class {
	#name : #Footballer,
	#superclass : #Athlete,
	#instVars : [
		'club',
		'annualContract',
		'goalsScored'
	],
	#category : #'Project-Athlete'
}

{ #category : #comparing }
Footballer >> < anotherAthlete [
	"Перевіряє чи дохід поточного спортсмена менший"

	^ self calculateIncome < anotherAthlete calculateIncome
]

{ #category : #comparing }
Footballer >> = anotherAthlete [
	"Перевіряє чи доходи спортсменів рівні"

	^ self calculateIncome = anotherAthlete calculateIncome
]

{ #category : #comparing }
Footballer >> > anotherAthlete [
	"Перевіряє чи дохід поточного спортсмена більший"

	^ anotherAthlete calculateIncome < self calculateIncome
]

{ #category : #accessing }
Footballer >> annualContract [
    "Повертає розмір річного контракту"
    ^ annualContract
]

{ #category : #accessing }
Footballer >> annualContract: aNumber [
	"Встановлює розмір річного контракту"

	aNumber isNumber
		ifTrue: [
			aNumber > 0
				ifTrue: [ annualContract := aNumber ]
				ifFalse: [
				self error: 'Хибне значення розміру річного контракту: ' , aNumber ] ]
		ifFalse: [
			self error:
				'Недопустиме значення розміру річного контракту: ' , aNumber ].
	^ aNumber
]

{ #category : #calculating }
Footballer >> calculateIncome [
    "Розраховує дохід футболіста: контракт + 1% за кожен забитий гол"
    | goalBonus |
    goalBonus := goalsScored * (annualContract * 0.01).
    ^ annualContract + goalBonus
]

{ #category : #accessing }
Footballer >> club [
    "Повертає назву клубу"
    ^ club
]

{ #category : #accessing }
Footballer >> club: aString [
	"Встановлює назву клубу"

	aString isString
		ifTrue: [ club := aString ]
		ifFalse: [ self error: 'Недопустиме значення клубу: ' , aString ].
	^ aString
]

{ #category : #comparing }
Footballer >> compareIncomeTo: anotherAthlete [
    "Порівнює прибутковість з іншим спортсменом"
    self < anotherAthlete ifTrue: [ ^ -1 ].
    self > anotherAthlete ifTrue: [ ^ 1 ].
    ^ 0
]

{ #category : #accessing }
Footballer >> goalsScored [
    "Повертає кількість забитих голів"
    ^ goalsScored
]

{ #category : #accessing }
Footballer >> goalsScored: aNumber [
	"Встановлює кількість забитих голів"

	aNumber isInteger
		ifTrue: [
			aNumber > 0
				ifTrue: [ goalsScored := aNumber ]
				ifFalse: [
				self error: 'Хибне значення кількості забитих голів: ' , aNumber ] ]
		ifFalse: [
			self error:
				'Недопустиме значення кількості забитих голів: ' , aNumber ].
	^ aNumber
]

{ #category : #initialization }
Footballer >> initialize [
	"Ініціалізація футболіста з базовими значеннями"

	super initialize.
	club := ''.
	annualContract := 0.
	goalsScored := 0
]

{ #category : #printing }
Footballer >> printOn: aStream [
    "Виводить інформацію про футболіста"
    super printOn: aStream.
    aStream 
        nextPutAll: ' (Футболіст)';
        cr;
        nextPutAll: 'Клуб: '; nextPutAll: club asString;
        cr;
        nextPutAll: 'Контракт: '; nextPutAll: annualContract asString; nextPutAll: ' грн';
        cr;
        nextPutAll: 'Забито голів: '; nextPutAll: goalsScored asString;
        cr;
        nextPutAll: 'Загальний дохід: '; nextPutAll: self calculateIncome asString; nextPutAll: ' грн'
]
