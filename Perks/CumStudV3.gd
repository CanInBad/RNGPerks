extends PerkBase

func _init():
	id = "Perk.BreedStudV3"
	skillGroup = Skill.Breeder

func getVisibleName():
	return "Gambler Cum Stud"

func getVisibleDescription():
	return "Your balls have a chance of instantly fills up after an orgasm (HOW)"

func getRequiredPerks():
	return [Perk.BreedStud, Perk.BreedStudV2]

func getSkillTier():
	return 2

func getPicture():
	return "res://Modules/RNGPerks/Images/horse-head-w-dieNew.png"

# func getCost():
# 	return 6 # how

func getBuffs():
	return [
		buff("Buff.PenisCumGenRNGAfterOrgasmBuff", [70, 30]), 
	]
	
