module model/User

entity User {
	realname :: String
	username :: String (id)
	password :: Secret
}

principal is User with credentials username, password