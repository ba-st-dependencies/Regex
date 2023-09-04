"
Unit tests for extensions done by Regex package
"
Class {
	#name : #RxExtensionsTest,
	#superclass : #TestCase,
	#category : #'Regex-Core-Tests'
}

{ #category : #tests }
RxExtensionsTest >> testSplitJoinBoundaryCases [
	"Empty splitter, joiner or sequence."
	self assert: ('' join: ('.' asRegex split: '')) equals: ''. "NB: Doesn't work with empty regex"
]

{ #category : #tests }
RxExtensionsTest >> testSplitStringOnRegex [

	self assert: ( '[aeiou]+' asRegex split: 'foobar' ) equals: #( 'f' 'b' 'r' ) asOrderedCollection
]
