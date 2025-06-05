extends Area2D

var target_enemy: Enemy

@onready var player: Player = get_tree().get_nodes_in_group("Player")[0]

var projectile_scene: PackedScene = preload("res://scenes/Weapon/Projectile/Projectile.tscn")
var projectile_list: Array = [
	preload("res://resources/Projectile/base.tres")
]

var near_by_enemy_list: Array = []

var closest = null
var closest_distance : float = INF

# 获取最近敌人坐标
func get_closest_target() -> Vector2:
	closest_distance = INF
	for i in near_by_enemy_list:
		if is_instance_valid(i):
			var distance : float = global_position.distance_squared_to(i.global_position)
			if distance < closest_distance:
				closest = i
				closest_distance = distance
				return closest.global_position
			else:
				return Vector2()
		else:
			continue
	return Vector2()


func _on_body_entered(body: CharacterBody2D) -> void:
	near_by_enemy_list.append(body)

# 生成投射物，generate projectile
func _on_attack_timer_timeout() -> void:
	var target_pos = get_closest_target()
	var arc_degree = player.projectile_number * 20 if player.projectile_number < 8 else 180 
	var arc_radian =  deg_to_rad(arc_degree)
	if target_pos != Vector2():
		for i in player.projectile_number:
			var projectile: ProjectileBase = projectile_scene.instantiate()
			# 投射物位置
			projectile.global_position = get_parent().global_position
			projectile.target_pos = target_pos
			projectile.state = projectile_list[0].duplicate()
			
			projectile.look_at(target_pos)
			if player.projectile_number > 1:
				# 多投射物角度
				var incrasment = arc_radian / (player.projectile_number - 1)
				projectile.global_rotation = (projectile.global_rotation + incrasment * i - arc_radian / 2)
				
			
			# 应用投射物升级项
			for upgrade in player.projectile_upgrades:
				upgrade.apply_upgrade(projectile)

			# projectile.look_at(target_pos)

			get_parent().get_parent().add_child(projectile)
			# get_parent().get_parent().call_deferred("add_child", projectile)

func debug_print(projectile) -> void:
		print("###")
		print(projectile.state.speed, " ",projectile.state.damage, " ", projectile.state.pierce_count)
		print(projectile_list[0].speed, " ", projectile_list[0].damage, " ", projectile_list[0].pierce_count)
		print("###")
