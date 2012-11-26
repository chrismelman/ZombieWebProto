module UI/survivor

page showSurvivor(s : Survivor){
	bmain{
		pageHeader2{output(s.name)}
		gridRow{
			gridSpan(10, 1) {
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
									descriptionItem("alive") { output(s.alive.toString()) }

								}
								if(s.lastAttack != null || s.lastAttack != "") {
									controlGroup("lastAttack"){rawoutput(s.lastAttack)}
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

page showAllSurvivor() {
	pageHeader2{"Survivors"}
	action healall() {
		for(sv : Survivor) {
			sv.heal();
		}
	}
	action healdeath() {
		for(sv : Survivor in Survivor.all() where !sv.alive ) {
			sv.heal();
		}
	}
	action heal (sv : Survivor) {
		sv.heal();
	}
	gridSpan(10, 1) {
		bmain {
			gridRow {
				gridSpan(10) {
					tableHovered {
						theader {
							th { "Name" }
							th { "Healt" }
							th { "Heal" }
						}
						tbody {
							for(sv : Survivor) {
								row {
			 						column { output(sv.name) }
									column { output(sv.healt) }
									column { 
										form { 
											submitlink heal(sv)[class:= "btn btn-success"] {iPlusSign()}
										}
									}
								}
							}
						}
					}
					horizontalForm {
						formActions {
							submitlink healall() [class:= "btn btn-primary"] {"Heal all"} "   "
						 	submitlink healdeath() [class:= "btn btn-primary"] {"Heal Death"}
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
	
	rule page showAllSurvivor(){ 
		loggedIn() && securityContext.principal == admin
	}
}