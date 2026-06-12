extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
#test

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func removeUi():
	var main_menu := get_child(0)
	#main_menu.visible = false
	#print(main_menu.visible)
	#main_menu.process_mode = Node.PROCESS_MODE_DISABLED
	print("E")
	main_menu.queue_free()
	
