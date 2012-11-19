module model/User

entity User {
	realname :: String
	username :: String (id, name)
	password :: Secret
}

init {
	var testUser := User {
		realname := "pietje bell"
		username := "piet"
		password := "superpiet"
	};
	testUser.password := testUser.password.digest();
	testUser.save(); 
}

principal is User with credentials username, password