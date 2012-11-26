module model/Survivor

entity Survivor {
	name :: String (id)
	attack :: Int
	defence :: Int
	healt :: Int
	maxHealt :: Int
	user -> User
	alive :: Bool := maxHealt > 0
	
	function heal() {
		healt := maxHealt;
	}
}




