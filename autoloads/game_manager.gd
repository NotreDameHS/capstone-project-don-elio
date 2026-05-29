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


func _ready() -> void:
	health = max_health
	var player = player.instantiate()
	#player.axe_upgrade()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



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
	
