Class {
	#name : #AthleteContainer,
	#superclass : #Object,
	#instVars : [
		'athletes'
	],
	#category : #'Project-Athlete'
}

{ #category : #accessing }
AthleteContainer >> add: anAthlete [
    "Додає спортсмена до контейнера"
    athletes add: anAthlete.
    ^ anAthlete
]

{ #category : #adding }
AthleteContainer >> addAthleteDialog [
    "Діалог для додавання нового спортсмена"
    | athleteType surname age citizenship |
    
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
    
    "Створення спортсмена відповідного типу"
    athleteType = 1 
        ifTrue: [ self addFootballerWithSurname: surname age: age asNumber citizenship: citizenship ]
        ifFalse: [ self addTennisPlayerWithSurname: surname age: age asNumber citizenship: citizenship ]
]

{ #category : #adding }
AthleteContainer >> addFootballerWithSurname: surname age: age citizenship: citizenship [
    "Додає футболіста через діалог"
    | footballer club contract goals |
    
    club := UIManager default 
        request: 'Клуб:' 
        initialAnswer: 'Динамо Київ'.
    club ifNil: [ ^ self ].
    
    contract := UIManager default 
        request: 'Річний контракт (грн):' 
        initialAnswer: '5000000'.
    contract ifNil: [ ^ self ].
    
    goals := UIManager default 
        request: 'Забито голів:' 
        initialAnswer: '20'.
    goals ifNil: [ ^ self ].
    
    footballer := Footballer new.
    footballer surname: surname.
    footballer age: age.
    footballer citizenship: citizenship.
    footballer club: club.
    footballer annualContract: contract asNumber.
    footballer goalsScored: goals asNumber.
    
    self add: footballer.
    
    UIManager default inform: 'Футболіста ', surname, ' додано!'
]

{ #category : #adding }
AthleteContainer >> addTennisPlayerWithSurname: surname age: age citizenship: citizenship [
    "Додає тенісиста через діалог"
    | player ranking salary prizeMoney |
    
    ranking := UIManager default 
        request: 'Світовий рейтинг:' 
        initialAnswer: '50'.
    ranking ifNil: [ ^ self ].
    
    salary := UIManager default 
        request: 'Зарплата (грн):' 
        initialAnswer: '3000000'.
    salary ifNil: [ ^ self ].
    
    prizeMoney := UIManager default 
        request: 'Призові за останні 3 турніри (через кому):' 
        initialAnswer: '100000,200000,150000'.
    prizeMoney ifNil: [ ^ self ].
    
    player := TennisPlayer new.
    player surname: surname.
    player age: age.
    player citizenship: citizenship.
    player worldRanking: ranking asNumber.
    player salary: salary asNumber.
    "Додай призові якщо є відповідний метод"
    
    self add: player.
    
    UIManager default inform: 'Тенісиста ', surname, ' додано!'
]

{ #category : #accessing }
AthleteContainer >> athletes [
    "Повертає колекцію спортсменів"
    ^ athletes
]

{ #category : #searching }
AthleteContainer >> findRichestAthlete [
    "Знаходить спортсмена з найбільшим доходом"
    | richest |
    athletes ifEmpty: [ ^ nil ].
    
    richest := athletes first.
    athletes do: [ :athlete |
        athlete > richest ifTrue: [ richest := athlete ]
    ].
    
    ^ richest
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
