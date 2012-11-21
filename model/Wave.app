module model/Wave

entity WaveItem {
	kind -> ZombieKind
	nr :: Int (validate(this.nr >= 0, "must be a positiveNumber"))
}

entity Wave {
	list -> List<WaveItem>
	
}