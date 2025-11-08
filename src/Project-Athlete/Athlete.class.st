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
	citizenship := ''.
	salary := 0
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
Athlete >> salary: anObject [

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
