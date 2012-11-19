module model/User

entity User {
	realname :: String
	username :: String (name)
	password :: Secret
}

derive crud  User