extends Path2D

@export var mob_scene: PackedScene
@onready var spawn_follow = $PathFollow2D
const Mob = preload("res://Mobs/basic_mob.tscn")
var rng := RandomNumberGenerator.new()

func _on_timer_timeout():
	var rng := RandomNumberGenerator.new()
	spawn_follow.progress_ratio = rng.randf()
	
	# Instance and position the mob
	var mob = mob_scene.instantiate()
	mob.global_position = spawn_follow.global_position
	get_parent().add_child(mob)
	mob.reparent(get_tree().current_scene)
