module UI/survivor

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
									descriptionItem("defence") { output(s.defence) }
									descriptionItem("healt") { output(s.healt) }
									descriptionItem("max healt") { output(s.maxHealt) }
									descriptionItem("alive") { output(s.alive) }

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