module UI/admin

var currentWave := Wave {
	name := "current wave"
	list := List<WaveItem>()
}
page admin () {
	
	bmain{
		pageHeader2{"Admin"}
		gridRow(){
			gridSpan(10, 1){
				horizontalForm("wave") {
					gridSpan(4){
						for(item : WaveItem in currentWave.list) {
							horizontalDescription{
								descriptionItem(item.kind.name){
									output(item.nr)
								}
							}
						}
						submitlink action{currentWave.clear();}[class:="btn btn-primary "]{"clear"}
					}
					gridSpan(4){
						for(kind : ZombieKind) {
							Zombiewaveinput(kind)
						}
						submitlink action{}[class:="btn btn-primary "]{"addAll"}
					}
				}
			}
		}
		
	}
}

template Zombiewaveinput(zk : ZombieKind){
	var newitem : WaveItem
	init {
		newitem := WaveItem {
			kind := zk
			nr := 0
		};
	}
	horizontalDescription{
		descriptionItem(zk.name){
				input(newitem.nr)
		}
	}
}
access control rules {
	rule page admin() {
		loggedIn() && securityContext.principal.username == "lucifer"
	}
}