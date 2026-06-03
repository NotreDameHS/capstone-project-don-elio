extends Path2D

@export var basic_mob_scene: PackedScene
@export var fast_mob_scene: PackedScene
@export var big_mob_scene: PackedScene
@onready var spawn_follow = $PathFollow2D
const Basic_Mob = preload("res://Mobs/basic_mob.tscn")
const Speedy_Mob = preload("res://Mobs/fast_mob.tscn")
const Slow_Boss = preload("res://Mobs/slow_boss.tscn")
var mobs_list : Array = [Slow_Boss, Slow_Boss, Slow_Boss, Slow_Boss, Speedy_Mob, Slow_Boss]
var rng := RandomNumberGenerator.new()

func _ready() -> void:
	var mobs_list : Array = [Basic_Mob, Basic_Mob, Basic_Mob, Basic_Mob, Speedy_Mob, Slow_Boss]
	print(mobs_list)

func _on_timer_timeout():
	var mobs_list : Array = [basic_mob_scene, basic_mob_scene, basic_mob_scene, basic_mob_scene, fast_mob_scene, big_mob_scene]
	spawn_follow.progress_ratio = rng.randf()
	
	# Instance and position the mob
	var mob = mobs_list.pick_random().instantiate()
	mob.global_position = spawn_follow.global_position
	get_parent().add_child(mob)
	mob.reparent(get_tree().current_scene)
