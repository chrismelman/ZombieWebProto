module model/Survivor

entity Survivor {
	name :: String (id)
	attack :: Int
	deffence :: Int
	user -> User
}

var first := Survivor {
		name := "thebest"
		attack := 20
		deffence := 15
		user := findUserByUsername("piet")[0]
	}


