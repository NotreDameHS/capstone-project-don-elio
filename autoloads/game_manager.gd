extends Node
var level := 0
var exp := 0
var exp_to_level_up := 100
var max_speed := 300
var health := 100
var max_health := 100


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health = max_health
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _level_up():
	level += 1
	health = max_health
	exp_to_level_up *= 1.3
	#Add Everything to level up later
	
	
	
	
func _gain_exp():
	exp += 10
	if exp >= exp_to_level_up:
		exp -= exp_to_level_up
		_level_up()
	
