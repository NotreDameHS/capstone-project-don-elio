extends Area2D
class_name Player
@export var max_speed := 300
@onready var hitbox := $Hitbox
@export var hitbox_size := 65
@onready var health_bar := $UI/HealthBar


func _ready() -> void:
	hitbox.shape = hitbox.shape.duplicate()
	hitbox.shape.radius = hitbox_size
	health_bar.max_value = GameManager.max_health
	health_bar.value = GameManager.health
	axe_upgrade()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var direction := Vector2(0,0)
	direction.y = Input.get_axis("move_up", "move_down")
	direction.x = Input.get_axis("move_left", "move_right")
	if direction.x < 0:
		get_node("Sprite2D").flip_h = true
	var velocity := direction * max_speed * delta
	position += velocity
	
func take_damage(amount):
	GameManager.health -= amount
	health_bar.value -= amount
	if GameManager.health <= 0:
		die()

func die():
	pass #FINISH LATER

func _on_area_entered(area: Area2D) -> void:
	if area is Collectable:
		GameManager._gain_exp()
	if area is Mob:
		take_damage(area.damage)

func axe_upgrade():
	if GameManager.axe_level == 0:
		var add_axe = GameManager.axe.instantiate()
		add_child(add_axe)
		
func bomb_upgrade():
	if GameManager.bomb_level == 0:
		var add_bomb = GameManager.bomb.instantiate()
		add_child(add_bomb)
			
func ball_upgrade():
	if GameManager.ball_level == 0:
		var add_ball = GameManager.fun_ball.instantiate()
		add_child(add_ball)
