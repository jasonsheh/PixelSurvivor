extends VBoxContainer

# @onready var player: CharacterBody2D = get_tree().get_nodes_in_group("Player")[0]
@onready var player: Player = get_tree().get_nodes_in_group("Player")[0]


func _ready() -> void:
	$StatHp.text = "最大生命值：\t\t%d" % player.max_hp
	$StatHpReGen.text = "生命回复：\t\t%d" % player.hp_regen
