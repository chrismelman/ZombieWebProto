module model/Wave

entity WaveItem {
	kind -> ZombieKind
	nr :: Int (validate(this.nr >= 0, "must be a positiveNumber"))
}

entity Wave {
	name :: String(id)
	list -> List<WaveItem>
	
	function clear () {
		list.clear();
	}
	
	function add(item : WaveItem) {
		for(witem : WaveItem in list) {
			if(witem.kind == item.kind) {
				witem.nr := witem.nr + item.nr;
				return;
			}
		}
		list.add(item);	
	}
	
	function makeZombieList() : List<Zombie> {
		var zombielist := List<Zombie>();
		for(item : WaveItem in list) {
			for(count : Int from 0 to item.nr){
				zombielist.add(item.kind.makeZombie());
			}
		}
		return zombielist;
	}
}