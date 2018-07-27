extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var unit = load("res://unit.tscn")
var enemy = load("res://enemy.tscn")
var unitDoubleRevolver = load("res://unitDoubleRevolver.tscn")
var unitSniper = load("res://sniper.tscn")
var unitHoneyBadger = load("res://honey badger.tscn")
var unitMachineGun = load("res://Machine Gun.tscn")
var selectedTowerType = null
var towerSelect = true

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	$Timer.start()

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _physics_process(delta):
	if Input.is_action_just_pressed("leftMouseButton") && towerSelect == false:
		placeTower(get_global_mouse_position())
		towerSelect = true
	if towerSelect == true and $VBoxContainer/Container.clicked == true:
		print($VBoxContainer/Container.unitType)
		towerSelect = false
		selectedTowerType = $VBoxContainer/Container.unitType
	elif towerSelect == true and $VBoxContainer/Container2.clicked == true:
		print($VBoxContainer/Container2.unitType)
		towerSelect = false
		selectedTowerType = $VBoxContainer/Container2.unitType
	elif towerSelect == true and $VBoxContainer/Container3.clicked == true:
		print($VBoxContainer/Container3.unitType)
		towerSelect = false
		selectedTowerType = $VBoxContainer/Container3.unitType
	elif towerSelect == true and $VBoxContainer/Container4.clicked == true:
		print($VBoxContainer/Container4.unitType)
		towerSelect = false
		selectedTowerType = $VBoxContainer/Container4.unitType
	elif towerSelect == true and $VBoxContainer/Container5.clicked == true:
		print($VBoxContainer/Container5.unitType)
		towerSelect = false
		selectedTowerType = $VBoxContainer/Container5.unitType	
		
		
		
		
		
		
func placeTower(pos):
	if selectedTowerType == "Pistol Unit":
		if $VBoxContainer/Money.subMoney(200) == false:
			$VBoxContainer/Money.addMoney(200) 
		else:
			var unitInstance = unit.instance()
			unitInstance.global_position = pos
			add_child(unitInstance)
		
	elif selectedTowerType == "Double Revolver Unit":
		if $VBoxContainer/Money.subMoney(400) == false:
			$VBoxContainer/Money.addMoney(400) 
		else:
			var unitInstance = unitDoubleRevolver.instance()
			unitInstance.global_position = pos
			add_child(unitInstance)
	elif selectedTowerType == "Sniper":
		if $VBoxContainer/Money.subMoney(800) == false:
			$VBoxContainer/Money.addMoney(800) 
		else:
			var unitInstance = unitSniper.instance()
			unitInstance.global_position = pos
			add_child(unitInstance)
	elif selectedTowerType == "Honey Badger Assault  Rifle":
		if $VBoxContainer/Money.subMoney(1000) == false:
			$VBoxContainer/Money.addMoney(1000) 
		else:	
			var unitInstance = unitHoneyBadger.instance()
			unitInstance.global_position = pos
			add_child(unitInstance)
	elif selectedTowerType == "Machine Gun":
		if $VBoxContainer/Money.subMoney(1200) == false:
			$VBoxContainer/Money.addMoney(1200) 
		else:
			var unitInstance = unitMachineGun.instance()
			unitInstance.global_position = pos
			add_child(unitInstance)
		
func _on_Timer_timeout():
	var enemyInstance = enemy.instance()
	enemyInstance.global_position = $TileMap/Path2D/Position2D.global_position
	$TileMap/Path2D.add_child(enemyInstance)
#	$Timer.wait_time = randi()%5+1
	$Timer.start()