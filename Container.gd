extends Container

# class member variables go here, for example:
# var a = 2
# var b = "textvar
export (String) var photo 
export (String) var unitType


var canClick 
var clicked

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	$Sprite.texture = load(photo)

func _process(delta):\
	
	clicked = false
	if canClick == true and Input.is_action_just_pressed("leftMouseButton"):
		print("You have selected ", unitType)
		clicked = true
		


func _on_Area2D_mouse_entered():
	canClick = true

func _on_Area2D_mouse_exited():
	canClick = false # replace with function body
