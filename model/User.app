module model/User

entity User {
	realname :: String
	username :: String (id)
	password :: Secret
}

init {
	var testUser := User {
		realname := "pietje bell"
		username := "piet"
		password := ("superpiet" as Secret).digest()
	};
	testUser.save(); 
}

principal is User with credentials username, password