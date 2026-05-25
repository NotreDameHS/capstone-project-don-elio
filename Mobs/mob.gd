extends Area2D
class_name Mob
@onready var hitbox := $Hitbox
@export var hitbox_size := 100
@export var speed := 50
@export var health := 100
@export var max_health := 100
@export var damage := 0
var player : Node = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hitbox.shape = hitbox.shape.duplicate()		# Duplicate it so it's unique to this mob
	hitbox.shape.radius = hitbox_size
	health = max_health



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var player := get_tree().get_nodes_in_group("Player")[0]
	position = position.move_toward(player.global_position, speed * delta)
	pass
	
func take_damage(damage):
	health -= damage
	#ui stuff
	if health <= 0:
		die()
		
func die():
	#write collectable spawning code here
	pass
	queue_free()
	
