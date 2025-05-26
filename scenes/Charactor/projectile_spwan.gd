extends Area2D

var target_enemy: Mob

@onready var player: CharacterBody2D = get_tree().get_nodes_in_group("Player")[0]
var projectile_scene: PackedScene = preload("res://scenes/Weapon/Projectile/Projectile.tscn")
var projectile_list: Array = [
	preload("res://resources/mob/dot.tres")
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
	if target_pos != Vector2():
		var projectile = projectile_scene.instantiate()
		projectile.global_position = get_parent().global_position
		projectile.target_pos = target_pos
		
		# 应用投射物升级项
		for upgrade in player.projectile_upgrades:
			upgrade.apply_upgrade(projectile)
			
		get_parent().get_parent().add_child(projectile)


#func apply_upgrades(projectile):
	#for upgrade in player.projectile_upgrades:
		#upgrade.apply_upgrade(projectile)
