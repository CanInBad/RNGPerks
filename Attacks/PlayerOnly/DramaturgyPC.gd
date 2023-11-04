extends Attack

# var useCount = int()

func _init():
	id = "DramaturgyPC"
	category = Category.Special
	aiCategory = AICategory.Unspecified
	
func getVisibleName(_context = {}): 
	return "Dramaturgy"

func getVisibleDesc(_context = {}):
	return "Roll the dice :D, use 15 stamina though :("
	
func giveBuffs(_attacker) -> void:
	_attacker.addEffect("StatusEffect.DramaSuccess", [2])
	_attacker.addEffect("StatusEffect.PerkExhaustion", [3])
	# var _didBuff = true
	# print("Success")
	# return 1

func calcPainDiffPlusOne(_attacker):
	var curPain = _attacker.getPain()
	var maxPain = _attacker.painThreshold()
	return maxPain - curPain - 1

func calcLustDiffPlusOne(_attacker):
	var curLust = _attacker.getLust()
	var maxLust = _attacker.lustThreshold()
	return maxLust - curLust - 1

func giveDebuffs(_attacker) -> void:
	_attacker.addEffect("StatusEffect.DramaFail", [2,-calcPainDiffPlusOne(_attacker),-calcLustDiffPlusOne(_attacker)])
	_attacker.addEffect("StatusEffect.PerkExhaustion", [3])
	#var _didDebuff = true
	# print("Fail")
	# return 2

func giveRandomItem(_attacker, _receiver) -> String:
	_attacker.addEffect("StatusEffect.PerkExhaustion", [3])
	var possibleItems = [
		"Shiv",
		"appleitem",
		"lube",
		"painkillers",
		"Condom",
		"EnergyDrink",
		"restraintkey",
		"Flashlight",
	]
	var selectedItem = RNG.pick(possibleItems)
	if _attacker is Player:
		var createItem = GlobalRegistry.createItem(selectedItem)
		GM.pc.getInventory().addItem(createItem)
		var item:ItemBase = createItem
		return str(item.getVisibleName())
	return "wah"
	# _attacker.getInventory().addItem(_receiver.getLoot(_receiver.battleName))

# func dummyPrint1() -> void:
# 	print("dummy1")

# func dummyPrint2() -> void:
# 	print("dummy2")
	
func _doAttack(_attacker, _receiver, _context = {}):

	# useCount += 1
	# print(useCount)

	if(checkMissed(_attacker, _receiver, DamageType.Physical)):
		return genericMissMessage(_attacker, _receiver, "Dramaturgy (HOW DID THAT MISSED)")
		
	if(checkDodged(_attacker, _receiver, DamageType.Physical)):
		return genericDodgeMessage(_attacker, _receiver, "Dramaturgy (HOW DID YOU DODGE)")
		
	var texts = [
		"{attacker.name} rolls the dice",
		"{attacker.name} hold E for 2 seconds to gain speed boost (totally not dbd)",
		"{attacker.name} just gambled",
		"{attacker.name} taking a chance",
		"{attacker.name} rolling D20 (real?)",

	]
	var text = RNG.pick(texts)
	
	var effects = [
		1,
		2,
		3,
	]

	var effect = RNG.pick(effects)
	print("given effect: "+ str(effect))
	match effect:
		1:
			text += RNG.pick([
				"\n\n{attacker.name} rolled and got a good luck!",
			])
			giveBuffs(_attacker)
		2:
			text += RNG.pick([
				"\n\n{attacker.name} rolled and got a bad luck!",
			])
			giveDebuffs(_attacker)
		3:
			text += RNG.pick([
				"\n\n{attacker.name} rolled and got a item!",
			])
			text += "\nYou got: [b]"+giveRandomItem(_attacker, _receiver)+"[/b]!"

		_:
			text += "\n NO EFFECT GIVEN????? HOW!!!!! "+str(effect)

	return {
		text = text,
		# pain = 0, # this is just a dice roll it shouldn't do any damages
	}
				
func canSeeAnticipationTextWhenBlind():
	return true
	
func getRequirements():
	return [[AttackRequirement.Stamina, 15]]

func _canUse(_attacker, _receiver, _context = {}):
	return !_attacker.hasEffect("StatusEffect.PerkExhaustion")
