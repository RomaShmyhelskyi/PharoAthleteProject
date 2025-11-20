"
`Athlete` class represents an athlete.

I know surname, age, citizenship, salary

It's API is 
- `surname`
- `age`
- `citizenship`
- `salary`


Its creation message is `newWithSurname:age:citizenship:`


"
Class {
	#name : #Athlete,
	#superclass : #Object,
	#instVars : [
		'surname',
		'age',
		'citizenship'
	],
	#category : #'Project-Athlete'
}

{ #category : #'as yet unclassified' }
Athlete class >> createWithDialog [

	| window anAthlete |
	window = CreateAthletePresenter new openModal.

	window isOk ifFalse: [ ^ nil ].

	anAthlete := Athlete
		             newWithSurname: window surname
		             age: window age
		             citizenship: window citizenship.
	^ anAthlete
]

{ #category : #'file operations' }
Athlete class >> example_1 [

	<script>
	| a |
	a := self newWithSurname: 'Alvarez' age: 28 citizenship: 'Mexican'.


	Transcript show: a
]

{ #category : #'file operations' }
Athlete class >> loadAthleteFromFile: filename [
	"Load one athlete from file FUEL"
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
Athlete class >> newWithSurname: aSurname age: anAge citizenship: aCitizenship [

	(aSurname isEmptyOrNil or: [
		 anAge < 4 or: [ aCitizenship isEmptyOrNil ] ]) ifTrue: [
		self error: 'Invalid athlete parameters' ].

	^ self new
		  surname: aSurname;
		  age: anAge;
		  citizenship: aCitizenship;
		  yourself
]

{ #category : #'file operations' }
Athlete class >> saveAthlete: anAthlete toFile: filename [
	"Save one athlete in file format FUEL"
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
Athlete >> = anObject [

	^ self salary = anObject salary
]

{ #category : #comparing }
Athlete >> > anObject [

	^ anObject < self
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
	citizenship := ''
]

{ #category : #printing }
Athlete >> printOn: aStream [
	"Метод для виведення інформації про атлета"

	aStream
		nextPutAll: 'Атлет: ';
		nextPutAll: surname;
		nextPutAll: '(';
		print: age;
		nextPutAll: ' р., ';
		nextPutAll: citizenship;
		nextPutAll: ')'
]

{ #category : #accessing }
Athlete >> salary [

	^ self subclassResponsibility
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
