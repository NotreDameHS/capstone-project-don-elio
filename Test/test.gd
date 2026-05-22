extends Node
@onready var _player = $Player
@onready var _label = $Interface/Label
@onready var _bar = $Interface


func _ready() -> void:
	_label.update_text(_player.level, _player.experience)
	pass 


func _process(delta: float) -> void:
	pass
