@tool
extends OverlaidMenu

@onready var player: Player = get_tree().get_nodes_in_group("Player")[0]
var upgrade_number: int = 3

var projectile_upgrade_dict: Dictionary = {
	"normal": [
		preload("res://resources/Upgrades/Projectile/simple_speed.tres"),
	], 
	"magic": [
		preload("res://resources/Upgrades/Projectile/simple_damage.tres"),
	], 
	"rare": [
		preload("res://resources/Upgrades/Projectile/pierce.tres"),
	], 
	"unique": [
		preload("res://resources/Upgrades/Projectile/number.tres"),
	], 
}

var player_upgrade_dict: Dictionary = {
	"normal": [
		preload("res://resources/Upgrades/Player/player_speed.tres"),
	], 
	"magic": [], 
	"rare": [], 
	"unique": [], 
}

var enemy_upgrade_dict: Dictionary = {
	"normal": [], 
	"magic": [], 
	"rare": [], 
	"unique": [], 
}


# 存储现有三个升级项
var upgrades: Array[Upgrade] = []


func _ready() -> void:
	upgrades.clear()
	get_upgrade()
	show_upgrade_info()


func get_upgrade() -> void:
	for i in range(upgrade_number):
		var upgrade_choice = randi_range(0, 1)
		# var upgrade_choice = randi_range(0, upgrade_number-1)
		if upgrade_choice == 0:
			get_projectile_upgrade()
		elif upgrade_choice == 1:
			get_player_upgrade()
		else:
			get_enemy_upgrade()
		

func get_player_upgrade() -> void:
	var rarity: String = Utils.get_random_rarity(GlobalData.Rarity)
	rarity =  "normal"
	var choice: int = randi_range(0, player_upgrade_dict[rarity].size()-1)
	upgrades.append(player_upgrade_dict[rarity][choice])

func get_projectile_upgrade() -> void:
	var rarity: String = Utils.get_random_rarity(GlobalData.Rarity)
	var choice: int = randi_range(0, projectile_upgrade_dict[rarity].size()-1)
	upgrades.append(projectile_upgrade_dict[rarity][choice])

func get_enemy_upgrade() -> void:
	var rarity: String = Utils.get_random_rarity(GlobalData.Rarity)
	var choice: int = randi_range(0, enemy_upgrade_dict[rarity].size()-1)
	upgrades.append(enemy_upgrade_dict[rarity][choice])


func show_upgrade_info() -> void:
	%Label1.text = upgrades[0].name
	%Upgrade1.text = upgrades[0].desription
	
	%Label2.text = upgrades[1].name
	%Upgrade2.text = upgrades[1].desription
	
	%Label3.text = upgrades[2].name
	%Upgrade3.text = upgrades[2].desription


func _on_upgrade_1_pressed() -> void:
	if upgrades[0].type == "projectile":
		player.projectile_upgrades.append(upgrades[0])
	elif upgrades[0].type == "player":
		player.player_upgrades.append(upgrades[0])
		player.apply_upgrades()
	elif upgrades[0].type == "enemy":
		player.enemy_upgrades.append(upgrades[0])
		
	close()


func _on_upgrade_2_pressed() -> void:
	if upgrades[1].type == "projectile":
		player.projectile_upgrades.append(upgrades[1])
	elif upgrades[1].type == "player":
		player.player_upgrades.append(upgrades[1])
		player.apply_upgrades()
	elif upgrades[1].type == "enemy":
		player.enemy_upgrades.append(upgrades[1])
		
	close()


func _on_upgrade_3_pressed() -> void:
	if upgrades[2].type == "projectile":
		player.projectile_upgrades.append(upgrades[2])
	elif upgrades[2].type == "player":
		player.player_upgrades.append(upgrades[2])
		player.apply_upgrades()
	elif upgrades[2].type == "enemy":
		player.enemy_upgrades.append(upgrades[2])
		
	close()
