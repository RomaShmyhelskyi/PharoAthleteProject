"
BaselineOfProjectAthlete описує базову конфігурацію проєкту ProjectAthlete.

Щоб завантажити проєкт у Pharo через Metacello, виконайте:

Metacello new
    baseline: 'ProjectAthlete';
    repository: 'github://RomaShmyhelskyi/PharoAthleteProject:master/src';
    load.

Пакети, що завантажуються:
- Project-Athlete — основний пакет логіки проєкту.
""
"
Class {
	#name : #BaselineOfProjectAthlete,
	#superclass : #BaselineOf,
	#category : #BaselineOfProjectAthlete
}

{ #category : #baselines }
BaselineOfProjectAthlete >> baseline: spec [

	<baseline>
	spec for: #common do: [
		spec repository:
			'github://RomaShmyhelskyi/PharoAthleteProject:master/src'.
		spec package: 'Project-Athlete' ]
]
