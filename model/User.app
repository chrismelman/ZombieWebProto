module model/User

entity User {
	realname :: String
	username :: String (id, name)
	password :: Secret
	survivor -> Survivor(inverse=Survivor.user)
}

init {
	var testUser := User {
		realname := "pietje bell"
		username := "piet"
		password := "superpiet"
	};
	testUser.password := testUser.password.digest();
	testUser.save(); 
	var first := Survivor {
		name := "thebest"
		attack := 20
		defence := 15
		healt := 100
		maxHealt := 100
		user := findUserByUsername("piet")[0]
	};
	first.save();
}

var admin := User {
		realname := "Satan"
		username := "lucifer"
		password := "666"
	}
	
principal is User with credentials username, password