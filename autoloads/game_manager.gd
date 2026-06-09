extends Node
@onready var player := preload("res://Player/player.tscn")
@onready var axe := preload("res://Player/Weapons/axe.tscn")
@onready var bomb := preload("res://Player/Weapons/bomb.tscn")
@onready var fun_ball := preload("res://Player/Weapons/gun.tscn")
@onready var game_root := preload("res://game_root.tscn")
@onready var mob_spawner := preload("res://autoloads/mob_spawner.tscn")

@onready var axe_proj := preload("res://Player/Weapons/Projectiles/axe_projectile.tscn")
@onready var bomb_proj := preload("res://Player/Weapons/Projectiles/bomb_projectile.tscn")
@onready var fun_proj := preload("res://Player/Weapons/Projectiles/bullet.tscn")

var axe_size := 1.0
var bomb_size := 1.0
var fun_ball_size := 1.0

var level := 0
var exp := 10
var exp_to_level_up := 100
var max_speed := 300
var health := 100
var max_health := 100

var upgrade_options : Array = ["axe", "bomb", "fun_ball", "proj_num", "attack_speed", "health", "player_speed", "damage"]
var weapon_options : Array = ["axe", "bomb", "fun_ball"]

var axe_level := 1
var bomb_level := 0
var ball_level := 0
var total_time_in_secs : int = 0
var player_scene = null

func _ready() -> void:
	health = max_health
	var player_scene = player.instantiate()
	#var game_root := game_root.instantiate()
	
func game_start():
	var player_scene = player.instantiate()
	# This grabs the 1st child of game root (your main menu)
	#var game_root := get_tree().current_scene.get_child(0)
	
	# This grabs the main game root node
	var game_root := get_tree().current_scene
	print(game_root)
	print("####")
	print(player_scene)
	get_tree().current_scene.add_child(player_scene)
	upgrade(player_scene)
	game_root.removeUi()
	
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func upgrade(player_scene):
	print(weapon_options)
	level += 1
	if level == 1:
		var start_weapon = weapon_options.pick_random()
		if start_weapon == "axe":
			var axe_scene = axe.instantiate()
			player_scene.add_child(axe_scene)
		elif start_weapon == "bomb":
			var bomb_scene = bomb.instantiate()
			player_scene.add_child(bomb_scene)
		elif start_weapon == "fun_ball":
			var fun_ball_scene = fun_ball.instantiate()
			player_scene.add_child(fun_ball_scene)
	else:
		var upgrade_choice = upgrade_options.pick_random()
		if upgrade_choice == "axe":
			axe_level += 1
		elif upgrade_choice == "bomb":
			bomb_level += 1
		elif upgrade_choice == "fun_ball":
			ball_level += 1
		elif upgrade_choice == "proj_num":
			var weapons := get_tree().get_nodes_in_group("Weapon")
			for attack in weapons:
				attack.projectiles_num += 1
		elif upgrade_choice == "attack_speed":
			var weapons := get_tree().get_nodes_in_group("Weapon")
			for attack in weapons:
				attack.attack_speed *= 1.3
				attack.attacktimer.wait_time = 1.0 / attack.attack_speed
		elif upgrade_choice == "health":
			max_health += 50
		elif upgrade_choice == "player_speed":
			player.max_speed += 50
		elif upgrade_choice == "damage":
			var weapons := get_tree().get_nodes_in_group("Weapon")
			for attack in weapons:
				attack.damage += 30

func _level_up():
	level += 1
	health = max_health
	exp_to_level_up *= 1.3
	#Add Everything to level up later
	

func _gain_exp():
	exp += 10
	if exp >= exp_to_level_up:
		exp -= exp_to_level_up
		_level_up()
	
func _on_timer_timeout() -> void:
	total_time_in_secs += 1
	var m = int(total_time_in_secs / 60.0)
	var s = total_time_in_secs - m * 60
	$"StopWatch Label".text = '%02d:%02d' % [m, s] 
	pass # Replace with function body.
