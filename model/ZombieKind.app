module model/ZombieKind

entity ZombieKind {
	sortname :: String (id,name)
	attack :: Int
	deffence :: Int
	healt :: Int
	image :: URL
}

var one := ZombieKind {
	sortname := "losers"
	attack := 1
	deffence := 2
	healt := 10
	image := "http://warzcentral.com/wp-content/uploads/2012/11/ZOTDsubmission.jpg"
}