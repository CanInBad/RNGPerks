extends StatusEffectBase

var painThreshDeduct = int()
var lustThreshDeduct = int()

func _init():
	id = "StatusEffect.DramaFail"
	isBattleOnly = true
	
func initArgs(_args = []):
	if(_args.size() > 0):
		turns = _args[0]
		painThreshDeduct = _args[1]
		lustThreshDeduct = _args[2]
	else:
		turns = 1
	
func processBattleTurn():
	turns -= 1
	if(turns <= 0):
		stop()

func processTime(_secondsPassed: int):
	pass

func getEffectName():
	return "Drama Fail"

func getEffectDesc():
	return "You are debuffed for " + str(turns) + " more turns"

func getEffectImage():
	return "res://Modules/RNGPerks/Images/Buffs/DramaBad.png"

func getIconColor():
	return IconColorRed

func getBuffs():
	return [
		buff(Buff.MaxPainBuff, [painThreshDeduct]),
		buff(Buff.MaxLustBuff, [lustThreshDeduct])
	]

func combine(_args = []):
	if(_args.size() > 0):
		turns = max(_args[0], turns)
		painThreshDeduct = max(_args[1], painThreshDeduct)
		lustThreshDeduct = max(_args[1], lustThreshDeduct)
	else:
		turns = max(1, turns)
		painThreshDeduct = max(1, painThreshDeduct)
		lustThreshDeduct = max(1, lustThreshDeduct)

func saveData():
	return {
		"turns": turns,
	}
	
func loadData(_data):
	turns = SAVE.loadVar(_data, "turns", 3)
