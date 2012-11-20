module UI/admin

page admin () {
	var wave:= List<Zombie>()
	var test : ZombieKind := ZombieKind.all()[0]
	action getnewInfo(zk : ZombieKind){
		replace(info,showZombieKind(test));
	}
	bmain{
		pageHeader2{"Admin"}
		gridRow(){
			gridSpan(10, 1){
				horizontalForm("wave") {
					gridSpan(4){
						output(wave)
					}
					gridSpan(4){
						input(test) [onchange := getnewInfo(test)]
						gridContainer(){
							placeholder info showZombieKind(test)
							submitlink action {
								var newZombie := Zombie {
									kind := test
									healt := test.healt
								};
								wave.add(newZombie);
							} {"Add"}
						}
					}
				}
			}
		}
		
	}
}

access control rules {
	rule page admin() {
		loggedIn() && securityContext.principal.username == "lucifer"
	}
}