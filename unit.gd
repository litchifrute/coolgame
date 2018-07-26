extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"


var speed = 25.0
var projectile = load("res://projectile.tscn")
var activeShooting = false
var bodPos = null
var timerIsRunning = false
var lookForNewEnemy = true
var enemy_target = null

export(NodePath) var enemy_path = null

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	
	
	#var direction
	#if bodPos != null:
		#direction = (bodPos - global_position).normalized()
		#move_and_slide(direction * speed)
		#rotation_degrees = rad2deg(direction.angle())
	if activeShooting and timerIsRunning == false and enemy_target != null:
		$Timer.start()
		timerIsRunning = true
		shoot()
	if $shootingRange.get_overlapping_bodies().size() > 0:
		enemy_target = get_best_enemy($shootingRange.get_overlapping_bodies())
		if enemy_target == null:
			activeShooting = false
			lookForNewEnemy = true
		else:
			activeShooting = true
			lookForNewEnemy = false

func get_best_enemy(bodies):
	# CHANGE AT WILL BUT BE CAREFUL
	var best_enemy = null
	for body in bodies:
		if body.is_in_group('enemy'):
			if best_enemy == null:
				best_enemy = body
			if body.get_parent().offset > best_enemy.get_parent().offset:
				best_enemy = body
	return best_enemy

func _on_shootingRange_body_entered(body):
	bodPos = body.global_position
	if body.is_in_group("enemy") and lookForNewEnemy == true:
		enemy_target = body
		print("In range")
		
		activeShooting = true
		lookForNewEnemy = false
func shoot():
	var wr = weakref(enemy_target)
	if not wr.get_ref():
		enemy_target = null
		return
	var shootLocation = enemy_target.global_position - global_position
	shootLocation.normalized()
	var projectileInstance = projectile.instance()
	
	get_parent().get_parent().add_child(projectileInstance)
	projectileInstance.shoot(shootLocation, global_position)
	
	


func _on_Timer_timeout():
	timerIsRunning = false

func _on_shootingRange_body_exited(body):
	if body.is_in_group("enemy"):
		bodPos = null
		enemy_target = null
		activeShooting = false
		lookForNewEnemy = true
