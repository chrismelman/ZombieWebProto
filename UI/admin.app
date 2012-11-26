module UI/admin

page attack(){
	var sv := Survivor.all()[0]
	action attack(sv : Survivor) {
		sv.attacks(currentWave.makeZombieList());
	}
	bmain{
		pageHeader2{"Wave Builder"}
		gridRow(){
			gridSpan(10, 1){
				horizontalForm("current") {
					gridRow {
						showWave(currentWave)
						gridSpan(4){
							controlGroup("kind"){
								input(sv) [class :="input-small"]
							}
						}
					}
					formActions {
						submit attack(sv)[class:="btn btn-danger"] {iFire()}
					}
				}
			}
		}
	}
}

access control rules {
	rule page attack() {
		loggedIn() && securityContext.principal == admin
	}
}