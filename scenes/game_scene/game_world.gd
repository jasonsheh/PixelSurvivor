extends Control

# signal level_won
signal level_lost
var stage: int = 1
var pharse: int = 1

var enemy_scene: Array[PackedScene] = [
	preload("res://scenes/Charactor/Enemy/dot.tscn"),
	preload("res://scenes/Charactor/Enemy/triangle.tscn"),
	preload("res://scenes/Charactor/Enemy/square.tscn"),
]

var stage_enemy_list: Array[int] = []


func _ready() -> void:
	spwan_by_stage()
	
	# $SpwanTimer.wait_time = 1
	
	$UI/RightContainer/Playtime.pharse_changed.connect(spwan_by_stage)


func spwan_by_stage() -> void:
	if stage == 1:
		if pharse == 1:
			stage_enemy_list = [0]
		if pharse == 2:
			stage_enemy_list = [0,1]


func _on_spwan_timer_timeout() -> void:
	var enemy_choice: int = randi_range(0, stage_enemy_list.size()-1)
	var enemy = enemy_scene[stage_enemy_list[enemy_choice]].instantiate()
	
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
