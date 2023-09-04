"
Instance holds onto a lookead which matches but does not consume anything.

Instance variables:
	predicate		<RxmLink>
"
Class {
	#name : #RxmLookahead,
	#superclass : #RxmLink,
	#instVars : [
		'lookahead'
	],
	#category : #'Regex-Core-Links'
}

{ #category : #'instance creation' }
RxmLookahead class >> with: aPiece [

	^self new lookahead: aPiece
]

{ #category : #accessing }
RxmLookahead >> lookahead [
	^ lookahead
]

{ #category : #accessing }
RxmLookahead >> lookahead: anRxmLink [
	lookahead := anRxmLink
]

{ #category : #matching }
RxmLookahead >> matchAgainst: aMatcher [
	"Match if the predicate block evaluates to true when given the
	current stream character as the argument."

	| original result |
	original := aMatcher currentState.
	result := lookahead matchAgainst: aMatcher.
	aMatcher restoreState: original.
	^ result not
		and: [ next matchAgainst: aMatcher ]
]

{ #category : #building }
RxmLookahead >> terminateWith: aNode [
	lookahead terminateWith: aNode.
	super terminateWith: aNode
]
