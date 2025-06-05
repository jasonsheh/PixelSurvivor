@tool
extends OverlaidMenu

@onready var player: Player = get_tree().get_nodes_in_group("Player")[0]
var upgrade_number: int = 3

var projectile_upgrade_dict: Dictionary[String, Array] = {
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

var player_upgrade_dict: Dictionary[String, Array] = {
	"normal": [
		preload("res://resources/Upgrades/Player/player_speed.tres"),
	], 
	"magic": [
		preload("res://resources/Upgrades/Player/max_hp.tres"),
	], 
	"rare": [
		preload("res://resources/Upgrades/Player/hp_steal.tres"),
	], 
	"unique": [
		preload("res://resources/Upgrades/Player/projectile_number.tres"),
	], 
}

var enemy_upgrade_dict: Dictionary[String, Array] = {
	"normal": [], 
	"magic": [], 
	"rare": [], 
	"unique": [], 
}


# 存储现有三个升级项
var upgrades: Array[Upgrade] = []
@onready var upgrade_labels: Array = [%Label1, %Label2, %Label3]
@onready var upgrade_icons: Array[TextureRect] = [%Icon1, %Icon2, %Icon3]

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
	for i in range(upgrade_number):
		upgrade_labels[i].text = "
[center]
[color={color}][font_size=32]{Name}[/font_size]
[font_size=22]{rarity}[/font_size][/color]

[font_size=18]{desription}[/font_size]
[/center]".format(
			{"Name": upgrades[i].name,
			"rarity":upgrades[i].rarity,
			"desription": upgrades[i].desription,
			"color": GlobalData.rarity_color[upgrades[i].rarity],
		})
		
		upgrade_icons[i].texture = upgrades[i].icon


func _on_upgrade_pressed(arg: int) -> void:
	if upgrades[arg].type == "projectile":
		player.projectile_upgrades.append(upgrades[arg])
	elif upgrades[arg].type == "player":
		player.player_upgrades.append(upgrades[arg])
		player.apply_upgrades()
	elif upgrades[arg].type == "enemy":
		player.enemy_upgrades.append(upgrades[arg])
		
	close()
