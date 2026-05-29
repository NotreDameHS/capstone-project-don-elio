extends Mob


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _physics_process(delta: float) -> void:
	var player := get_tree().get_nodes_in_group("Player")[0]
	if distance_to(get_nodes_in_group("Player")) >
	position = position.move_toward(player.global_position, speed * delta)
