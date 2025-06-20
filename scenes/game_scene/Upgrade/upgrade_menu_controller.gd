class_name UpgradeMenuController
extends Node

## Node for opening a pause menu when detecting a 'ui_cancel' event.


@export var pause_menu_packed : PackedScene
# @export var focused_viewport : Viewport

func _ready() -> void:
	%Player.player_level_up.connect(_on_player_level_up)


func _on_player_level_up() -> void:
	var current_menu = pause_menu_packed.instantiate()
	get_tree().current_scene.call_deferred("add_child", current_menu)
	await current_menu.tree_exited
