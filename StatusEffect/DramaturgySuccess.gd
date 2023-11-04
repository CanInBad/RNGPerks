extends StatusEffectBase

func _init():
	id = "StatusEffect.DramaSuccess"
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
	return "Drama Success"

func getEffectDesc():
	return "You are buffed for " + str(turns) + " more turns"

func getEffectImage():
	return "res://Modules/RNGPerks/Images/Buffs/DramaGood.png"

func getIconColor():
	return IconColorGreen

func getBuffs():
	return [
		buff(Buff.PhysicalDamageBuff, [100]),
		buff(Buff.LustDamageBuff, [100])
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
