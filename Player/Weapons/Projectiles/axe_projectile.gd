extends "res://Player/Weapons/Projectiles/projectile.gd"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite.scale *= GameManager.axe_size
	hitbox.shape.radius *= GameManager.axe_size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
