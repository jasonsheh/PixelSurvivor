@tool
extends OverlaidMenu

@onready var player: Player = get_tree().get_nodes_in_group("Player")[0]
var upgrade_number: int = 3
var projectile_upgrade_normal_list: Array = [
	preload("res://resources/Upgrades/Projectile/simple_speed.tres"),
]
var projectile_upgrade_magic_list: Array = [
	preload("res://resources/Upgrades/Projectile/simple_damage.tres"),
]
var projectile_upgrade_rare_list: Array = [
	preload("res://resources/Upgrades/Projectile/pierce.tres"),
]
var projectile_upgrade_unique_list: Array = [
	preload("res://resources/Upgrades/Projectile/number.tres"),
]

# ToDo
var upgrades: Array[Upgrade] = []


func _ready() -> void:
	get_upgrade()
	show_upgrade_info()


func get_upgrade() -> void:
	for i in range(upgrade_number):
		var rarity: String = Utils.get_random_rarity(GlobalData.Rarity)
		match rarity:
			"normal": upgrades.append(projectile_upgrade_normal_list[0])
			"magic": upgrades.append(projectile_upgrade_magic_list[0])
			"rare": upgrades.append(projectile_upgrade_rare_list[0])
			"unique": upgrades.append(projectile_upgrade_unique_list[0])


func show_upgrade_info() -> void:
	%Label1.text = upgrades[0].name
	%Upgrade1.text = upgrades[0].desription
	
	%Label2.text = upgrades[1].name
	%Upgrade2.text = upgrades[1].desription
	
	%Label3.text = upgrades[2].name
	%Upgrade3.text = upgrades[2].desription


func _on_upgrade_1_pressed() -> void:
	player.projectile_upgrades.append(upgrades[0])
	close()


func _on_upgrade_2_pressed() -> void:
	player.projectile_upgrades.append(upgrades[1])
	close()


func _on_upgeade_3_pressed() -> void:
	player.projectile_upgrades.append(upgrades[2])
	close()
