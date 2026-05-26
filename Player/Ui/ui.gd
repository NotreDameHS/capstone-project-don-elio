extends CanvasLayer
class_name Ui

@export var stopwatch_label : Label


var total_time_in_secs : int = 0

func _ready() -> void:
	$Timer.start()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


#hello world

func _on_button_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	total_time_in_secs += 1
	var m = int(total_time_in_secs / 60.0)
	var s = total_time_in_secs - m * 60
	$"StopWatch Label".text = '%02d:%02d' % [m, s] 
	pass # Replace with function body.
