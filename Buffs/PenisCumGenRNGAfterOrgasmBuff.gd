extends BuffBase

var amount = 0
var chance = 0
# var PlayerExt = load("res://Modules/RNGPerks/PlayerExtend/PlayerExt.gd")
# var inBallNew = yes.new()

func _init():
	id = "Buff.PenisCumGenRNGAfterOrgasmBuff"

func initBuff(_args):
	amount = _args[0]
	if _args[1]!=null:
		match _args[1]: # capping?
			[-9999, 0]: # they don't allow open pattern so this have to do?
				chance = 0
			[1, 100]:
				chance = _args[1]
			[101, ..]:
				chance = 100
			_:
				chance = 30 # well if the null check fails then here's backup

func getCapacityPP(fluidSource) -> float:
	if(fluidSource == FluidSource.Penis):
		if(GM.pc.hasBodypart(BodypartSlot.Penis)):
			var penis:BodypartPenis = GM.pc.getBodypart(BodypartSlot.Penis)
			return penis.getFluidProduction().getCapacity()
		return 0.0
	return 0.0

func getVisibleDescription():
	var text1 = str(amount)
	var text2 = str(chance)
	if(amount > 0):
		text1 = "+"+text1
	return "Instant cum generation after orgasm "+text1+"%"+" with success rate of "+text2+"%"

func apply(_buffHolder):
	var inBall = GM.pc.getFluidAmount(FluidSource.Penis)
	var maxBall = getCapacityPP(FluidSource.Penis)
	inBall = float(inBall)
	# print(maxBall)
	maxBall = float(maxBall)
	# print(inBall) 
	
	if inBall != null:
		if inBall <= (maxBall/3 + 24):
			# print("YES!")
			if RNG.chance(chance):
				# GM.ui.say("the perk successfully activates") #idk if this works, imagine if it isn't
				# print("the perk activates")
				_buffHolder.addCustom(BuffAttribute.CumGenerationAfterOrgasm, amount/100.0)

func getBuffColor():
	if(amount < 0 || chance < 0):
		return Color.red
	return DamageType.getColor(DamageType.Lust)

func saveData():
	var data = .saveData()
	
	data["amount"] = amount
	data["chance"] = chance

	return data
	
func loadData(_data):
	.loadData(_data)
	amount = SAVE.loadVar(_data, "amount", 0.0)
	chance = SAVE.loadVar(_data, "chance", false) # what does null value do?????
	
func combine(_otherBuff):
	if(_otherBuff.amount > amount):
		amount = _otherBuff.amount
	if(_otherBuff.chance > chance):
		chance = _otherBuff.chance #does this works?
