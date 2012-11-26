module model/User

entity User {
	realname :: String( validate(this.realname.length() >= 5, "name should be atleast 5 long"))
	username :: String (id, name, validate(this.username.length() >= 5, "name should be atleast 5 long"))
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
		attack := 20.0
		defence := 15.0
		healt := 100.0
		maxHealt := 100.0
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