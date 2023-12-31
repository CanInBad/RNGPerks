extends Module

func _init():
	id = "RNGPerks"
	author = "CanInBad"
	
	attacks = [
		"res://Modules/RNGPerks/Attacks/PlayerOnly/DramaturgyPC.gd",
		"res://Modules/RNGPerks/Attacks/PlayerOnly/FlashlightPCAttack.gd",
	]
	perks = [
		"res://Modules/RNGPerks/Perks/CumStudV3.gd",
		"res://Modules/RNGPerks/Perks/Dramaturgy.gd",
		"res://Modules/RNGPerks/Perks/CriticalLust.gd",
		"res://Modules/RNGPerks/Perks/CriticalCombat.gd"
	]
	items = [
		"res://Modules/RNGPerks/Items/Weapons/Flashlight.gd",
	]
	buffs = [
		"res://Modules/RNGPerks/Buffs/PenisCumGenRNGAfterOrgasmBuff.gd",
		"res://Modules/RNGPerks/Buffs/LustDamageBuffRNG.gd",
		"res://Modules/RNGPerks/Buffs/PhysicalDamageBuffRNG.gd"
	]
	statusEffects = [
		"res://Modules/RNGPerks/StatusEffect/DramaturgySuccess.gd",
		"res://Modules/RNGPerks/StatusEffect/DramaturgyFail.gd",
		"res://Modules/RNGPerks/StatusEffect/PerkExhaustion.gd",
	]
	# characters = [
	# 	"res://Modules/RNGPerks/PlayerExtend/PlayerExt.gd"
	# ]
