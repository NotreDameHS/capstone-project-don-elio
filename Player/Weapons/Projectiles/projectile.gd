extends Area2D

@export var lifespan := 1.0
@onready var lifetimer := $Lifespan
@export var projectile_speed := 1
@export var damage := 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	lifetimer.wait_time = lifespan
	lifetimer.start()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_lifespan_timeout() -> void:
	queue_free()


func _on_area_entered(area: Area2D) -> void:
	if area is Mob:
		area.take_damage(damage)
