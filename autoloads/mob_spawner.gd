extends Path2D

@export var mob_scene: PackedScene
@onready var spawn_follow = $PathFollow2D

func _on_timer_timeout():
	# Randomly pick a point along the Path2D
	spawn_follow.progress_ratio = randf()
	
	# Instance and position the mob
	var mob = mob_scene.instantiate()
	mob.global_position = spawn_follow.global_position
	get_parent().add_child(mob)
