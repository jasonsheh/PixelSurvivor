extends Marker2D

@export var damage_node: PackedScene


func popup(hurt: int) -> void:
	var damage = damage_node.instantiate()
	damage.position = global_position
	damage.get_child(0).text = str(hurt)
	
	var tween = create_tween()
	tween.tween_property(damage,"position", global_position + _random_direction(), 0.75)
	
	get_parent().get_parent().add_child(damage)

func _random_direction() -> Vector2:
	return Vector2(randf_range(-1,1), randf()) * 16
