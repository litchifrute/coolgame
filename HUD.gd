extends VBoxContainer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var canClick 

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if canClick == true and Input.is_action_just_pressed("leftMouseButton"):
		print("You have selected Pistol Unit")
		
func _on_Area2D_mouse_entered():
	canClick = true


func _on_Area2D_mouse_exited():
	canClick = false