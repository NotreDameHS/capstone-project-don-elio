extends Mob


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _physics_process(delta: float) -> void:
	var player := get_tree().get_nodes_in_group("Player")[0]
	if get_tree().current_scene.distance_to(player) > 300:
		speed *= -1
	else:
		speed *= 1
	position = position.move_toward(player.global_position, speed * delta)
