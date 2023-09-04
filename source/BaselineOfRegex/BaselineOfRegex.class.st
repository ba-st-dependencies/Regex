Class {
	#name : #BaselineOfRegex,
	#superclass : #BaselineOf,
	#category : #BaselineOfRegex
}

{ #category : #baselines }
BaselineOfRegex >> baseline: spec [

	<baseline>
	spec for: #pharo do: [
		spec
			package: 'Regex-Core';
			package: 'Regex-Extensions' with: [ spec requires: 'Regex-Core' ];
			package: 'Regex-Core-Tests' with: [ spec requires: #( 'Regex-Core' 'Regex-Extensions' ) ];
			group: 'Tests' with: 'Regex-Core-Tests'
		]
]

{ #category : #accessing }
BaselineOfRegex >> projectClass [

	^ MetacelloCypressBaselineProject
]
