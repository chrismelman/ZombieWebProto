application ZombieApp

imports model/main
imports UI/main
	define page root(){ 
		bmain{
			pageHeader2{"Welcome to the ProtoType of ZombieWebApp"} 
			image("http://www.incgamers.com/wp-content/uploads/2012/06/left-4-dead-1024x576.jpg")
		}
	}
	
access control rules {
	rule page root() {
		true
	}
}