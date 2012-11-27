module model/ZombieKind

entity ZombieKind {
	sortname :: String (id,name)
	attack :: Float
	defence :: Float
	healt :: Float
	image :: URL
	
	function makeZombie(): Zombie {
		return Zombie {
			healt := healt
			kind := this
		};
	}
}

init {
	var one := ZombieKind {
		sortname := "losers"
		attack := 20.0
		defence := 20.0
		healt := 10.0
		image := "http://warzcentral.com/wp-content/uploads/2012/11/ZOTDsubmission.jpg"
	};

	var two := ZombieKind {
		sortname := "fatZombies"
		attack := 10.0
		defence := 100.0
		healt := 120.0
		image := "http://static.tvtropes.org/pmwiki/pub/images/fat_zombie_boomer.jpg"
	};
	one.save();
	two.save();

}
