extends ItemBase

var charges:int = 2

func useCharge(amount = 1):
	charges -= amount
	if(charges <= 0):
		destroyMe()

func getCharges():
	return charges

# func getDamageRange():
# 	return [50, 60]

func _init():
	id = "Flashlight"

func getVisibleName():
	return "Flashlight"

func canDamage():
	return false

func getDescription():
	# var text = "An improvised weapon with a sharp tip.\nDoes "+Util.dmgRangeArrayStr(getDamageRange())+" physical damage and causes bleeding.\nHas enough durability for "+str(charges)+" "+Util.multipleOrSingularEnding(charges, "use")
	var text = "A high powered flashlight used to light your way in the darkness.\nMost of the charges are spent by the original owner\n(can only be used in combat)"
	return text

func saveData():
	var data = .saveData()
	
	data["charges"] = charges
	
	return data
	
func loadData(data):
	.loadData(data)
	
	charges = SAVE.loadVar(data, "charges", 2)

func getAttacks():
	return ["FlashlightPCAttack"]

func getTags():
	return [ItemTag.Illegal]

func getItemCategory():
	return ItemCategory.Weapons
