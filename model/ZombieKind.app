module model/ZombieKind

entity ZombieKind {
	sortname :: String (id,name)
	attack :: Int
	defence :: Int
	healt :: Int
	image :: URL
}

var one := ZombieKind {
	sortname := "losers"
	attack := 2
	defence := 2
	healt := 10
	image := "http://warzcentral.com/wp-content/uploads/2012/11/ZOTDsubmission.jpg"
}

var two := ZombieKind {
	sortname := "fatZombies"
	attack := 1
	defence := 10
	healt := 20
	image := "http://static.tvtropes.org/pmwiki/pub/images/fat_zombie_boomer.jpg"
}