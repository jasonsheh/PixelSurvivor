extends Control

# signal level_won
signal level_lost

var enemy_scene: Array[PackedScene] = [
	preload("res://scenes/Charactor/Enemy/dot.tscn"),
	preload("res://scenes/Charactor/Enemy/square.tscn"),
]
var enemy_list: Array = [
	preload("res://resources/Enemy/dot.tres"),
	preload("res://resources/Enemy/square.tres"),
]


func _on_spwan_timer_timeout() -> void:
	var enemy = enemy_scene[0].instantiate()
	enemy.state = enemy_list[0]
	
	var spawn_pos = _get_spawn_position()
	enemy.position = spawn_pos

	add_child(enemy)


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
