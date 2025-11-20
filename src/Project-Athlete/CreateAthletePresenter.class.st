Class {
	#name : #CreateAthletePresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'okButton',
		'cancelButton',
		'surnameText',
		'ageText',
		'citizenshipText'
	],
	#category : #'Project-Athlete'
}

{ #category : #accessing }
CreateAthletePresenter >> age [

	^ ageText text
]

{ #category : #accessing }
CreateAthletePresenter >> citizenship [

	^ citizenshipText text
]

{ #category : #layout }
CreateAthletePresenter >> defaultLayout [

	^ SpGridLayout new
		  add: 'Surname' at: 1 @ 1;
		  add: surnameText at: 2 @ 1;
		  add: 'Age' at: 1 @ 2;
		  add: ageText at: 2 @ 2;
		  add: 'Citizenship' at: 1 @ 3;
		  add: citizenshipText at: 2 @ 3;
		  yourself
]

{ #category : #initialization }
CreateAthletePresenter >> initializeDialogWindow: aDialogPresenter [

	aDialogPresenter centered.
	aDialogPresenter
		addButton: 'Cancel' do: [ :button | button close ];
		addButton: 'Create Athlete' do: [ :button |
			button
				beOk;
				close ]
]

{ #category : #initialization }
CreateAthletePresenter >> initializePresenters [

	surnameText := self newTextInput.
	ageText := self newNumberInput rangeMinimum: 4 maximum: 100.
	citizenshipText := self newTextInput
]

{ #category : #initialization }
CreateAthletePresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Film';
		initialExtent: 400 @ 250
]

{ #category : #accessing }
CreateAthletePresenter >> surname [

	^ surnameText text
]
