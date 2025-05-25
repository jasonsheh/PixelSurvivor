@tool
extends OverlaidMenu

@onready var player: CharacterBody2D = get_tree().get_nodes_in_group("Player")[0]

var projectile_upgrade_list: Array = [
	preload("res://resources/Upgrades/Projectile/simple_speed.tres"),
	preload("res://resources/Upgrades/Projectile/simple_damage.tres"),
]

var upgrade_1
var upgrade_2
var upgrade_3

func _ready() -> void:
	pass



func _on_upgrade_1_pressed() -> void:
	player.projectile_upgrades.append(projectile_upgrade_list[0])
	close()


func _on_upgrade_2_pressed() -> void:
	player.projectile_upgrades.append(projectile_upgrade_list[1])
	close()


func _on_upgeade_3_pressed() -> void:
	pass # Replace with function body.
