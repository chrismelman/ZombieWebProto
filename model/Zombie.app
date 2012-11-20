module model/Zombie

entity Zombie {
	kind -> ZombieKind
	healt :: Int
	alive :: Bool := healt > 0
}