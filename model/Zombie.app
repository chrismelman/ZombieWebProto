module model/Zombie

entity Zombie {
	kind -> ZombieKind
	healt :: Int
	alive :: Bool := healt > 0
	
	function attack(sv : Survivor) : String {
		var dm := (sv.attack / kind.defence);
		healt := healt - dm;
		return "zombie has been damaged -" + dm + "(healt:" + healt+ ")";
	}
}