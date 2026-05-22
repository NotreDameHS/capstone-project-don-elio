extends Area2D
class_name Player
@export var max_speed := 500
@onready var hitbox := $Hitbox
@export var hitbox_size := 65
@export var level = 1

var experience = 0
var experience_total = 0
var experience_required = get_required_experience(level + 1)


func get_required_experience(_level):
	return round(pow(level, 1.8) + level * 4)

func gain_experience(amount):
	experience_total += amount
	experience += amount
	while experience >= experience_required:
		experience -= experience_required
		levelup()
		
func levelup():
	level += 1
	experience_required = get_required_experience(level + 1)





func _ready() -> void:
	hitbox.shape = hitbox.shape.duplicate()
	hitbox.shape.radius = hitbox_size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var direction := Vector2(0,0)
	direction.y = Input.get_axis("move_up", "move_down")
	direction.x = Input.get_axis("move_left", "move_right")
	if direction.x < 0:
		get_node("Sprite2D").flip_h = true
	var velocity := direction * max_speed * delta
	position += velocity
