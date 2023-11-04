extends Attack

func _init():
	id = "FlashlightPCAttack"
	category = Category.Special
	aiCategory = AICategory.Unspecified
	isWeaponAttack = true
	
func getVisibleName(_context = {}):
	var item = getItem(_context)
	if(item == null):
		return "error"
	
	return item.getVisibleName()
	
func getVisibleDesc(_context = {}):
	var item = getItem(_context)
	if(item == null):
		return "error"
	
	return item.getVisisbleDescription()
	
func _doAttack(_attacker, _receiver, _context = {}):
	if(checkMissed(_attacker, _receiver, DamageType.Stamina)):
		return genericMissMessage(_attacker, _receiver, "lights on")
	
	if(checkDodged(_attacker, _receiver, DamageType.Stamina)):
		return genericDodgeMessage(_attacker, _receiver, "lights on")
	
	# var damageRange = [0,0]
	
	var item = getItem(_context)
	if(item != null):
		# damageRange = item.getDamageRange()
		item.useCharge()
	
	var texts = [
		"{attacker.name} shine lights to {receiver.name}!",
		"{attacker.name} lights up {receiver.name}!",
		"{attacker.name} pointed the light to {receiver.name}!",
	]
	var text = RNG.pick(texts)
	
	if(_receiver.addEffect(StatusEffect.Blindness)):
		text += " {receiver.name} is now [color=gray]blinded[/color]"

	return {
		text = text,
		# pain = 2 #RNG.randi_range(damageRange[0], damageRange[1]),
		stamina = 2
	}
	
func _canUse(_attacker, _receiver, _context = {}):
	return itemExists(_context)

func getAttackSoloAnimation():
	return ["aimpistol", "res://Modules/RNGPerks/Images/Flashlight/Flashlight.tscn"] #test
	# return "aimpistol" #how do you set image?

func getExperience():
	return [[Skill.Combat, 5]]

func getRecieverArmorScaling(_attacker, _receiver, _damageType) -> float:
	return 3.0

func getAttackerDamageMultiplierEfficiency(_attacker, _receiver, _damageType) -> float:
	return 0.0

func getRequirements():
	return [AttackRequirement.FreeArms, AttackRequirement.FreeHands, AttackRequirement.CanSee]
