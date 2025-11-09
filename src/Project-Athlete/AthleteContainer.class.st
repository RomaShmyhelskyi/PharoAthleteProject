"
Я є контейнером для управління колекціями спортсменів (футболістів та тенісистів).

Я надаю функціональність для:
- Зберігання спортсменів у порядковій колекції
- Додавання спортсменів програмно або через інтерактивні діалоги
- Пошуку найбагатшого спортсмена за доходом
- Фільтрації спортсменів за громадянством
- Виконання пакетних операцій (наприклад, збільшення віку)
- Виведення всіх спортсменів з їхнім доходом

Приклад використання:
    container := AthleteContainer new.
    container addFootballerWithSurname: 'Шевченко' age: 35 
        citizenship: 'Україна' club: 'Динамо' contract: 5000000 goals: 25.
    container addAthleteDialog.
    richest := container findRichestAthlete.
    ukrainians := container ukrainianAthletes.
    container increaseAgeByOneYear.
    container printAll.

Змінні екземпляра:
    athletes    <OrderedCollection>    Колекція об'єктів спортсменів
"
Class {
	#name : #AthleteContainer,
	#superclass : #Object,
	#instVars : [
		'athletes'
	],
	#category : #'Project-Athlete'
}

{ #category : #accessing }
AthleteContainer >> add: anObject [
	"Додає спортсмена до контейнера"

	(anObject isKindOf: Athlete)
		ifTrue: [ athletes add: anObject ]
		ifFalse: [
			self error:
				'Недопустимий тип обʼєкта для колекції атлетів: ' , anObject ].

	^ anObject
]

{ #category : #adding }
AthleteContainer >> addAthleteDialog [
    "Діалог для додавання нового спортсмена"
    | athleteType surname age citizenship club annualContract goalsScored worldRanking salary prizeMoney| 
    
    "Вибір типу спортсмена"
    athleteType := UIManager default 
        chooseFrom: #('Footballer' 'TennisPlayer')
        title: 'Оберіть тип спортсмена:'.
    
    athleteType = 0 ifTrue: [ ^ self ]. "Скасовано"
    
    "Введення базової інформації"
    surname := UIManager default 
        request: 'Прізвище:' 
        initialAnswer: ''.
    surname ifNil: [ ^ self ].
    
    age := UIManager default 
        request: 'Вік:' 
        initialAnswer: '25'.
    age ifNil: [ ^ self ].
    
    citizenship := UIManager default 
        request: 'Громадянство:' 
        initialAnswer: 'Україна'.
    citizenship ifNil: [ ^ self ].

    club := UIManager default 
        request: 'Клуб' 
        initialAnswer: 'Динамо Київ'.
    club ifNil: [ ^ self ].

    annualContract := UIManager default 
        request: 'Контракт' 
        initialAnswer: '0'.
    annualContract ifNil: [ ^ self ].

    goalsScored := UIManager default 
        request: 'Забиті' 
        initialAnswer: '0'.
    goalsScored ifNil: [ ^ self ].

    worldRanking := UIManager default 
        request: 'Рейтинг' 
        initialAnswer: '0'.
    worldRanking ifNil: [ ^ self ].

    salary := UIManager default 
        request: 'ЗП' 
        initialAnswer: '0'.
    salary ifNil: [ ^ self ].

    prizeMoney := UIManager default 
        request: 'Призові' 
        initialAnswer: '0'.
    prizeMoney ifNil: [ ^ self ].

    
    "Створення спортсмена відповідного типу"
    athleteType = 1 
        ifTrue: [ self addFootballerWithSurname: surname age: age citizenship: citizenship club: club
annualContract: annualContract goalsScored: goalsScored ]
        ifFalse: [ self addTennisPlayerWithSurname: surname age: age citizenship: citizenship worldRanking: worldRanking salary: salary prizeMoney: prizeMoney ]
]

{ #category : #adding }
AthleteContainer >> addFootballerWithSurname: surname age: age citizenship: citizenship club: club
annualContract: annualContract goalsScored: goalsScored [
    "Додає футболіста з базовими параметрами (без діалогу)"
    | footballer |
    footballer := Footballer new.
    footballer surname: surname.
    footballer age: age.
    footballer citizenship: citizenship.
    footballer club: ''.
    footballer annualContract: annualContract.
    footballer goalsScored: goalsScored.
    
    self add: footballer.
    ^ footballer
]

{ #category : #adding }
AthleteContainer >> addTennisPlayerWithSurname: surname age: age citizenship: citizenship worldRanking: worldRanking salary: salary prizeMoney: prizeMoney [
    "Додає тенісиста з базовими параметрами (без діалогу)"
    | player |
    player := TennisPlayer new.
    player surname: surname.
    player age: age.
    player citizenship: citizenship.
    player worldRanking: worldRanking.
    player salary: salary.
    "Додай призові якщо є відповідний метод, наприклад:"
    "player prizeMoney: prizeMoney."
    
    self add: player.
    ^ player
]

{ #category : #accessing }
AthleteContainer >> athletes [
    "Повертає колекцію спортсменів"
    ^ athletes
]

{ #category : #searching }
AthleteContainer >> findRichestAthlete [
	"Знаходить спортсмена з найбільшим доходом"

	^ athletes max: [ :a :b | a salary <= b salary ]
]

{ #category : #operations }
AthleteContainer >> increaseAgeByOneYear [
    "Збільшує вік всіх спортсменів на один рік"
    athletes do: [ :athlete |
        athlete age: athlete age + 1
    ]
]

{ #category : #initialization }
AthleteContainer >> initialize [
	"Ініціалізація контейнера з порожньою колекцією"

	super initialize.
	athletes := OrderedCollection new
]

{ #category : #searching }
AthleteContainer >> isRichestFootballer [
    "Перевіряє чи найбагатший спортсмен - футболіст"
    | richest |
    richest := self findRichestAthlete.
    richest ifNil: [ ^ false ].
    ^ richest isKindOf: Footballer
]

{ #category : #printing }
AthleteContainer >> printAll [
    "Друкує інформацію про всіх спортсменів"
    athletes ifEmpty: [ 
        ^ 'Контейнер порожній' 
    ].
    
    ^ String streamContents: [ :stream |
        stream nextPutAll: 'Список спортсменів:'; cr; cr.
        athletes doWithIndex: [ :athlete :index |
            stream 
                nextPutAll: index asString, '. ';
                nextPutAll: athlete surname;
                nextPutAll: ' (';
                nextPutAll: athlete class name;
                nextPutAll: ') - Дохід: ';
                nextPutAll: athlete calculateIncome asString;
                nextPutAll: ' грн';
                cr
        ]
    ]
]

{ #category : #accessing }
AthleteContainer >> size [
    "Повертає кількість спортсменів"
    ^ athletes size
]

{ #category : #operations }
AthleteContainer >> ukrainianAthletes [
    "Повертає нову колекцію з українськими спортсменами"
    ^ athletes select: [ :athlete | 
        athlete citizenship = 'Україна' 
    ]
]
