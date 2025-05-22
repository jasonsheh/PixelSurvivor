extends Control

var mob_scene: PackedScene = preload("res://scenes/Charactor/Mob.tscn")
var mob_list: Array = [
	preload("res://resources/mob/dot.tres")
]



func _on_spwan_timer_timeout() -> void:
	var mob = mob_scene.instantiate()
	mob.state = mob_list[0]
	
	var spawn_pos = _get_spawn_position()
	mob.position = spawn_pos

	#var movement = mob.get_node("Movement")
	#mob.set_speed(100)

	add_child(mob)


func _get_spawn_position() -> Vector2i:
	return _get_edge_position()
	
	
func _get_edge_position() -> Vector2:
	var edge_offset: int = 10
	var viewport = get_viewport().get_visible_rect()
	var edge = randi() % 4

	match edge:
		0: # 上边缘
			return Vector2i(
				randi_range(0, viewport.size.x), edge_offset
			)
		1: # 右边缘
			return Vector2i(
				randi_range(0, viewport.size.y), viewport.size.x - edge_offset
			)
		2: # 下边缘
			return Vector2i(
				randi_range(0, viewport.size.x), viewport.size.y - edge_offset
			)
		3: # 左边缘
			return Vector2i(
				randi_range(0, viewport.size.y), edge_offset
			)
	return Vector2i(0,0)
