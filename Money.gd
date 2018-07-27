extends Panel

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var money = 500

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	$Label.text = String(money)


func getMoney():
	return money
	
func setMoney(mon):
	money = mon

func addMoney(mon):
	money = money + mon

func subMoney(mon):
	money = money - mon
	if money >= 0:
		return true
	return false
	
