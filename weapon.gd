extends Node2D
#class_name Weapon
@export var damage := 0
@export var attack_speed := 0.0
@onready var attacktimer := $AttackTimer
@export var projectile_scene : PackedScene = null
@export var projectiles_num := 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	attacktimer.wait_time = 1.0 / attack_speed


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_attack_timer_timeout() -> void:
	for num in projectiles_num:
		var projectile = projectile_scene.instantiate()
		get_tree().current_scene.add_child(projectile)
		projectile.position = get_parent().global_position
		projectile.position.y += randf_range(-70, 70)
		projectile.position.x += randf_range(-70, 70)
		await get_tree().create_timer(0.2).timeout	
	
