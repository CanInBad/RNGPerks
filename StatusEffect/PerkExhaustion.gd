extends StatusEffectBase

func _init():
	id = "StatusEffect.PerkExhaustion"
	isBattleOnly = true
	
func initArgs(_args = []):
	if(_args.size() > 0):
		turns = _args[0]
	else:
		turns = 1
	
func processBattleTurn():
	turns -= 1
	if(turns <= 0):
		stop()

func processTime(_secondsPassed: int):
	pass

func getEffectName():
	return "Perk Exhaustion"

func getEffectDesc():
	return "You can't use the perk(s) for " + str(turns) + " more turns"

func getEffectImage():
	return "res://Modules/RNGPerks/Images/Buffs/PerkExhaustionNew.png"

func getIconColor():
	return IconColorYellow

func getBuffs(): # lmao I just copy paste the fail status to this one
	return [
		# buff(Buff.MaxPainBuff, [calcPainDiffPlusOne()]),
		# buff(Buff.MaxLustBuff, [calcLustDiffPlusOne()]) 
	]

func combine(_args = []):
	if(_args.size() > 0):
		turns = max(_args[0], turns)
	else:
		turns = max(1, turns)

func saveData():
	return {
		"turns": turns,
	}
	
func loadData(_data):
	turns = SAVE.loadVar(_data, "turns", 3)
