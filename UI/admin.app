module UI/admin

page attack(){
	var sv := Survivor.all()[0]
	var log : WikiText
	action attack(sv : Survivor) {
		log := sv.attacks(currentWave.makeZombieList());
		replace(logholder, showLog(log));
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
					placeholder logholder showLog("" as WikiText )
					formActions {
						submitlink attack(sv)[class:="btn btn-danger"] {iFire()}
					}
				}
			}
		}
	}
}


define ajax template showLog(log : WikiText) {
	if(log != "") {
		gridRow{
			well{
				rawoutput(log)
			}
		}
	}
}

access control rules {
	rule page attack() {
		loggedIn() && securityContext.principal == admin
	}
	
	rule ajaxtemplate showLog(log : WikiText) {
		loggedIn() && securityContext.principal == admin
	}
}
