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
