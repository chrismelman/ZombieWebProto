module model/Survivor

entity Survivor {
	name :: String (id)
	attack :: Int
	defence :: Int
	healt :: Int
	maxHealt :: Int
	user -> User
	
	function reset() {
		healt := maxHealt;
	}
}

var first := Survivor {
		name := "thebest"
		attack := 20
		defence := 15
		healt := 100
		maxHealt := 100
		user := findUserByUsername("piet")[0]
	}


