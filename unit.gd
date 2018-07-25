extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var target = Vector2(0,0)
var speed = 25.0
var projectile = load("res://projectile.tscn")

export(NodePath) var enemy_path = null

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	var enemy = get_parent().get_node("Path2D/enemy 1")
	if enemy != null:
		target = enemy.global_position
	
	var direction = (target - global_position).normalized()
	#print(direction)
	move_and_slide(direction * speed)
	rotation_degrees = rad2deg(direction.angle())

func _on_shootingRange_body_entered(body):
	if body is KinematicBody2D:
		print("In range")
		var shootLocation = body.global_position - global_position
		print(shootLocation)
		var projectileInstance = projectile.instance()
		projectileInstance.global_position = global_position
		projectileInstance.shoot(global_position, shootLocation)
		get_parent().add_child(projectileInstance)
		
