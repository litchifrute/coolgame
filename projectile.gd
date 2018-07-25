extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var speed = 10

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	#var dir = Vector2(1,0)
	#shoot(dir, position)
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func shoot(direction, pos):
	global_position = pos
	apply_impulse(pos, direction * speed)
	print(global_position)