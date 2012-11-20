module UI/zombieKind

define page showZombieKinds(){
	var test := ZombieKind.all()[0]
	action getnewInfo(zk : ZombieKind){
		replace(info,showZombieKind(test));
	}
	bmain{
		form{
			input(test) [onchange := getnewInfo(test)]
			
		}
		placeholder info showZombieKind(test)
	}
}

define ajax  showZombieKind(zk : ZombieKind) {
	
	pageHeader2{output(zk.sortname)}
	gridRow{
		gridSpan(10, 1){
			well{
				gridContainer(){
					gridSpan(5){
						horizontalForm("Information"){
							horizontalDescription {
								descriptionItem("name") { output(zk.name) }
								descriptionItem("attack") { output(zk.attack) }
								descriptionItem("defence") { output(zk.defence) }
								descriptionItem("healt") { output(zk.healt) }
	
							}
						}
					}
					gridSpan(4){
						image(zk.image)
								// image("http://www.internetpoison.com/wp-content/uploads/2010/03/Zombie_Killer_by_benchi1.jpg")
					}
				}
	
			}
		}
	}
}

access control rules {
	rule  ajaxtemplate showZombieKind(zk : ZombieKind) {
		loggedIn()
	}
	
	rule  page showZombieKinds() {
		loggedIn()
	}
}
