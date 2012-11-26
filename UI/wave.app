module UI/wave


var currentWave := Wave {
	name := "current wave"
	list := List<WaveItem>()
}
page buildWave () {
	var zk := ZombieKind.all()[0]
	var nr := 0;
	action getnewInfo(zk : ZombieKind){
		replace(info, showBasicZombiekindInfo(zk));
	}
	bmain{
		pageHeader2{"Wave Builder"}
		gridRow(){
			gridSpan(10, 1){
				horizontalForm("current") {
					gridRow(){
						showWave(currentWave)
						gridSpan(4){
							controlGroup("kind"){
								input(zk) [onchange := getnewInfo(zk), class :="input-small"]
							}
							controlGroup("number of") {
								input(nr)[class:="input-mini"]
							}
							wellSmall(){
								placeholder info showBasicZombiekindInfo(zk)
							}
						}
					}
					formActions{
						gridRow{
							gridSpan(3){
								submitlink action{currentWave.clear();}[class:="btn"]{"clear"}
							}
							gridSpan(4){
								submitlink action{ if(nr > 0) { currentWave.add(WaveItem { kind := zk nr := nr}) ;}}[class:="btn btn-primary "]{"Add"}
							}
						}
					}
				}
			}
		}
	}
}

define template showWave(wave : Wave) {
	gridSpan(4){
		for(item : WaveItem in wave.list) {
			horizontalDescription{
				descriptionItem(item.kind.name){
					output(item.nr)
				}
			}
		}			
	}
}


access control rules {
	rule page buildWave() {
		loggedIn() && securityContext.principal.username == "lucifer"
	}
}