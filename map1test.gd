extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var unit = load("res://unit.tscn")
var enemy = load("res://enemy.tscn")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	$Timer.start()

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _physics_process(delta):
	if Input.is_action_just_pressed("leftMouseButton"):
		placeTower(get_global_mouse_position())
		
func placeTower(pos):
	var unitInstance = unit.instance()
	unitInstance.global_position = pos
	add_child(unitInstance)

func _on_Timer_timeout():
	var enemyInstance = enemy.instance()
	enemyInstance.global_position = $TileMap/Path2D/Position2D.global_position
	$TileMap/Path2D.add_child(enemyInstance)
	$Timer.start()