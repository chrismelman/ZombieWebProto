module model/Survivor

entity Survivor {
	name :: String (id)
	attack :: Int
	deffence :: Int
	user -> User
}

init {
	var first := Survivor {
		name := "thebest"
		attack := 20
		deffence := 15
		user := findUserByUsername("piet")[0]
	};
}

page showSurvivor(s : Survivor){
	bmain{
		pageHeader2{output(s.name)}
		gridRow{
			gridSpan(10, 1){
				well{
					gridContainer(){
						gridSpan(5){
							horizontalForm("Information"){
								horizontalDescription {
									descriptionItem("name") { output(s.name) }
									descriptionItem("attack") { output(s.attack) }
									descriptionItem("deffence") { output(s.deffence) }


								}
							}
						}
						gridSpan(4){
							image("http://www.internetpoison.com/wp-content/uploads/2010/03/Zombie_Killer_by_benchi1.jpg")
						}
					}
					
					
				}
			}
		}
		
	}
}

access control rules {
	rule page showSurvivor(s : Survivor){ 
		loggedIn() && securityContext.principal == s.user
	}
}