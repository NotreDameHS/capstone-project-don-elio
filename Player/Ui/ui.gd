extends Node
class_name Ui

@export var stopwatch_label : Label

var stopwatch : StopWatch

func _ready() -> void:
	stopwatch = get_tree().get_first_node_in_group("stopwatch")

func update_stopwatch_label():
	stopwatch_label.text = stopwatch.time_to_string()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	update_stopwatch_label()
	pass


func _on_button_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.
