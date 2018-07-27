extends PathFollow2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export(float) var speed = 30


func _ready():
	set_process(true)

func _process(delta):
	# DELTA = time in seconds
	offset += delta * speed

func _on_Area2D_body_entered(body):
	if body is RigidBody2D:
		get_parent().get_parent().get_parent().get_node("VBoxContainer/Money").addMoney(2)
		#print(get_parent().get_parent().get_parent())
		queue_free()
		body.queue_free()