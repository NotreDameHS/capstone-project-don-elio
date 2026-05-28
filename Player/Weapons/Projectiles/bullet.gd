extends "res://Player/Weapons/Projectiles/projectile.gd"

var velocity : Vector2 = Vector2(0,0)
var bullet_speed := 10
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	velocity.x = randf_range(-1, 1)
	velocity.y = randf_range(-1, 1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += velocity * bullet_speed
