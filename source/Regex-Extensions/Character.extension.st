Extension { #name : #Character }

{ #category : #'*Regex-Extensions' }
Character >> sameAs: aCharacter [
	"Answer whether the receiver is equal to aCharacter, ignoring case"
	^ (self asLowercase = aCharacter asLowercase)
]
