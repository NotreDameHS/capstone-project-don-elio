extends Node2D

class_name  StopWatch
var time = 0.0
var stopped = false

func _process(delta: float) -> void:
	if stopped:
		return 
	time += delta
	
func reset():
	time = 0.0
