extends Node2D
@onready var main_menu := $MainMenu

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func removeUi():
	var main_menu := $MainMenu
	remove_child(main_menu)
	main_menu.queue_free()
	
