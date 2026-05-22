extends Area2D
class_name Projectile
@export var lifespan := 1
@onready var lifetimer := $Lifespan
@export var projectile_speed := 0
@onready var bomb_sprite := $BombSprite
@onready var explosion_sprite := $ExplosionSprite
@onready var hitbox := $Hitbox
@export var hitbox_size := 300
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	lifetimer.wait_time = lifespan
	lifetimer.start()
	explosion_sprite.hide()
	hitbox.shape = hitbox.shape.duplicate()		# Duplicate it so it's unique to this tower
	hitbox.shape.radius = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_lifespan_timeout() -> void:
	projectile_speed = 0
	bomb_sprite.hide()
	explosion_sprite.visible = true
	get_tree().current_scene.add_child(hitbox)
	hitbox.shape.radius = hitbox_size
	await get_tree().create_timer(0.1).timeout
	queue_free()
	
func _on_area_entered(area: Area2D) -> void:
	pass #
