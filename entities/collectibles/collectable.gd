extends Area2D
class_name Collectable
@export var exp_amount = 10
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("gain_exp"):
		print("Expereience gained :" + str(exp_amount))
		body.gain_exp(exp_amount)
		queue_free()
	pass # Replace with function body.


func _on_area_entered(area: Area2D) -> void:
	queue_free()
	pass # Replace with function body.
