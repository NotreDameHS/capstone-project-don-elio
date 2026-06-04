extends Node
@onready var player := preload("res://Player/player.tscn")
@onready var axe := preload("res://Player/Weapons/axe.tscn")
@onready var bomb := preload("res://Player/Weapons/bomb.tscn")
@onready var fun_ball := preload("res://Player/Weapons/gun.tscn")

@onready var axe_proj := preload("res://Player/Weapons/Projectiles/axe_projectile.tscn")
@onready var bomb_proj := preload("res://Player/Weapons/Projectiles/bomb_projectile.tscn")
@onready var fun_proj := preload("res://Player/Weapons/Projectiles/bullet.tscn")

var axe_size := 1.0
var bomb_size := 1.0
var fun_ball_size := 1.0

var level := 0
var exp := 0
var exp_to_level_up := 100
var max_speed := 300
var health := 100
var max_health := 100

var upgrade_options : Array = ["axe", "bomb", "fun_ball", "proj_num", "attack_speed", "health", "player_speed"]
var weapon_options : Array = ["axe", "bomb", "fun_ball"]

var axe_level := 1
var bomb_level := 0
var ball_level := 0
var total_time_in_secs : int = 0
var player_scene = null

func _ready() -> void:
	health = max_health
	var player_scene = player.instantiate()
	get_tree().current_scene.add_child(player_scene)
	upgrade(player_scene)
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func upgrade(player_scene):
	print(weapon_options)
	if level == 0:
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
