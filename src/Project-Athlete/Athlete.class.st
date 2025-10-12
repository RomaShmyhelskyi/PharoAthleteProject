"
`Athlete` class represents an athlete.

I know surname, age, citizenship, salary

It's API is 
- `surname`
- `age`
- `citizenship`
- `salary`


Its creation message is `initialize`


"
Class {
	#name : #Athlete,
	#superclass : #Object,
	#instVars : [
		'surname',
		'age',
		'citizenship',
		'salary'
	],
	#category : #'Project-Athlete'
}

{ #category : #'file operations' }
Athlete class >> loadAthletesFromFile: filename [
	"Завантажує колекцію спортсменів з файлу FUEL"
	| file loadedAthletes |
	file := filename asFileReference.
	file exists ifFalse: [ 
		Error signal: 'Файл не знайдено: ', file fullName 
	].
	loadedAthletes := FLMaterializer materializeFromFileNamed: file fullName.
	Transcript 
		show: 'Завантажено ', loadedAthletes size printString, 
		' спортсменів з файлу: ', file fullName; cr.
	^ loadedAthletes
]

{ #category : #'instance creation' }
Athlete class >> newWithSurname: aSurname age: anAge citizenship: aCitizenship salary: aSalary [

(aSurname isEmptyOrNil or: [anAge < 4 or: [ aCitizenship isEmptyOrNil or: [aSalary < 0]]]) 
ifTrue: [ self error: 'Invalid athlete parameters' ].

	^ self new
		  surname: aSurname;
		  age: anAge;
		  citizenship: aCitizenship;
		  salary: aSalary;
		  yourself
]

{ #category : #'file operations' }
Athlete class >> saveAthletes: aCollection toFile: filename [
	"Зберігає колекцію спортсменів (тенісистів та футболістів) у файл у форматі FUEL"
	| file |
	file := filename asFileReference.
	FLSerializer serialize: aCollection toFileNamed: file fullName.
	Transcript 
		show: 'Збережено ', aCollection size printString, 
		' спортсменів у файл: ', file fullName; cr.
	^ file
]

{ #category : #comparing }
Athlete >> < anObject [

	^ self salary < anObject salary
]

{ #category : #comparing }
Athlete >> <= anObject [

	^ self salary <= anObject salary
]

{ #category : #comparing }
Athlete >> = anObject [

	^ self salary = anObject salary
]

{ #category : #comparing }
Athlete >> > anObject [

	^ self salary > anObject salary
]

{ #category : #comparing }
Athlete >> >= anObject [

	^ self salary >= anObject salary
]

{ #category : #accessing }
Athlete >> age [

	^ age
]

{ #category : #accessing }
Athlete >> age: anObject [

	age := anObject
]

{ #category : #accessing }
Athlete >> citizenship [

	^ citizenship
]

{ #category : #accessing }
Athlete >> citizenship: anObject [

	citizenship := anObject
]

{ #category : #initialization }
Athlete >> initialize [

	super initialize.
	surname := ''.
	age := 0.
	citizenship := ''.
	salary := 0
]

{ #category : #printing }
Athlete >> printOn: aStream [

	super printOn: aStream.
	aStream nextPutAll: ' with value: '.
	surname printOn: aStream
]

{ #category : #accessing }
Athlete >> salary [

	^ salary
]

{ #category : #accessing }
Athlete >> salary: anObject [

	salary := anObject
]

{ #category : #accessing }
Athlete >> surname [

	^ surname
]

{ #category : #accessing }
Athlete >> surname: anObject [

	surname := anObject
]
