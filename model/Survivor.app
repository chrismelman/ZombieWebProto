module model/Survivor

entity Survivor {
	name :: String (id)
	attack :: Int
	defence :: Int
	healt :: Int
	maxHealt :: Int
	user -> User
	alive :: Bool := maxHealt > 0
	lastAttack :: WikiText
	
	function heal() {
		healt := maxHealt;
	}
	
	function attacks(zombies : List<Zombie>) {
		lastAttack := "";
		while(zombies.length > 0 || alive) {
			var head := zombies[0];
			lastAttack := lastAttack + "<p>" + head.attack(this)+ "</p>";
			if (!head.alive){
				zombies.remove(head);
				if(zombies.length > 0) {
					head := zombies[0];
				}
			}
			if(zombies.length > 0) {
				lastAttack := lastAttack + "<p>" + attack(head) + "</p>";
			}
		}
	}
	
	function attack(z : Zombie) : String {
		var dm := (z.kind.attack / defence);
		healt := healt - dm;
		return name +" has been damaged -" + dm + "(healt:" + healt+ ")";
	}
}





