extends PerkBase

func _init():
	id = "Perk.Dramaturgy"
	skillGroup = Skill.Combat

func getVisibleName():
	return "Dramaturgy"

func getVisibleDescription():
	return "Roll a chance while in combat"

func getMoreDescription():
	return "Either recieve your max pain and lust threshold, both damage types buffs, or an item. They have equal chance of happening so pray to RNG"

func getSkillTier():
	return 1

func getCost():
	return 4

func addsAttacks():
	return ["DramaturgyPC"]

func getPicture():
	return "res://Modules/RNGPerks/Images/dramaturgyNew.png"
