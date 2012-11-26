module model/Survivor

entity Survivor {
	name :: String (id)
	attack :: Float
	defence :: Float
	healt :: Float
	maxHealt :: Float
	user -> User
	alive :: Bool := healt > 0.0
	lastAttack :: WikiText
	
	function heal() {
		healt := maxHealt;
	}
	
	function attacks(zombies : List<Zombie>) : WikiText {
		lastAttack := "";
		while(zombies.length > 0 && alive) {
			var head := zombies[0];
			var temp := head.attack(this);
			log(temp);
			lastAttack := lastAttack + "<p>" + temp + "</p>";
			if (!head.alive) {
				zombies.remove(head);
				if(zombies.length > 0) {
					head := zombies[0];
				}
			}
			if(zombies.length > 0) {
				var temp := attack(head);
				log(temp);
				lastAttack := lastAttack + "<p>" + temp + "</p>";
			}
		}
		return lastAttack;
	}
	
	function attack(z : Zombie) : String {
		var dm := (z.kind.attack / defence);
		healt := healt - dm;
		return name +" has been damaged -" + dm + "(healt:" + healt+ ")";
	}
}





