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
Athlete class >> example_1 [

	<script>
	| a |
	a := Athlete
		     newWithSurname: 'Alvarez'
		     age: 28
		     citizenship: 'Mexican'
		     salary: 35000.


	Transcript
		show: a surname;
		space;
		show: a age asString;
		space;
		show: a citizenship;
		space;
		show: a salary asString;
		cr
]

{ #category : #'file operations' }
Athlete class >> loadAthleteFromFile: filename [
	"Завантажує одного спортсмена з файлу FUEL"
	| file loadedAthlete |
	file := filename asFileReference.
	file exists ifFalse: [ 
		Error signal: 'Файл не знайдено: ', file fullName 
	].
	loadedAthlete := FLMaterializer materializeFromFileNamed: file fullName.
	Transcript 
		show: 'Завантажено спортсмена ', loadedAthlete surname, 
		' з файлу: ', file fullName; cr.
	^ loadedAthlete
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
Athlete class >> saveAthlete: anAthlete toFile: filename [
	"Зберігає одного спортсмена у файл у форматі FUEL"
	| file |
	file := filename asFileReference.
	FLSerializer serialize: anAthlete toFileNamed: file fullName.
	Transcript 
		show: 'Збережено спортсмена ', anAthlete surname, 
		' у файл: ', file fullName; cr.
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

	^ anObject salary < self salary
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

	anObject isNumber
		ifTrue: [
			anObject > 0
				ifTrue: [ age := anObject ]
				ifFalse: [ self error: 'Значення віку хибне: ' , anObject ] ]
		ifFalse: [ self error: 'Недопустиме значення віку: ' , anObject ].
	^ anObject
]

{ #category : #accessing }
Athlete >> citizenship [

	^ citizenship
]

{ #category : #accessing }
Athlete >> citizenship: anObject [

	anObject isString
		ifTrue: [ citizenship := anObject ]
		ifFalse: [
		self error: 'Недопустиме значення громадянства: ' , anObject ].
	^ anObject
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

	anObject isNumber
		ifTrue: [
			anObject > 0
				ifTrue: [ salary := anObject ]
				ifFalse: [ self error: 'Хибне значення заробітку: ' , anObject ] ]
		ifFalse: [
		self error: 'Недопустиме значення заробітку: ' , anObject ].
	^ anObject
]

{ #category : #accessing }
Athlete >> surname [

	^ surname
]

{ #category : #accessing }
Athlete >> surname: anObject [

	anObject isString
		ifTrue: [ surname := anObject ]
		ifFalse: [ self error: 'Недопустиме значення прізвища: ' , anObject ].
	^ anObject
]
