extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"


var speed = 25.0
var projectile = load("res://projectile.tscn")
var activeShooting = false
var bodPos = null
var timerIsRunning = false

export(NodePath) var enemy_path = null

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	
	
	#var direction
	#if bodPos != null:
		#direction = (bodPos - global_position).normalized()
		#move_and_slide(direction * speed)
		#rotation_degrees = rad2deg(direction.angle())
	if activeShooting and timerIsRunning == false:
		$Timer.start()
		timerIsRunning = true
		shoot()

func _on_shootingRange_body_entered(body):
	if body is KinematicBody2D:
		
		print("In range")
		bodPos = body.global_position
		activeShooting = true

func shoot():
	var shootLocation = bodPos - global_position
	shootLocation.normalized()
	print(global_position)
	var projectileInstance = projectile.instance()
		
	get_parent().get_parent().add_child(projectileInstance)
	projectileInstance.shoot(shootLocation, global_position)
	
	


func _on_Timer_timeout():
	timerIsRunning = false


func _on_shootingRange2_body_exited(body):
	if body is RigidBody2D:
		activeShooting = false