extends Charactor

class_name Player

signal hp_changed
signal exp_changed

signal player_upgrade

var speed = 200

# UI相关
@export var max_hp: int = 10
@export var hp = 2
@export var max_exp = 5
@export var experence = 0

@export var level = 1
var player_upgrades = []
var projectile_upgrades: Array[Upgrade] = []

func _physics_process(delta):
	var input = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	position += input * speed * delta


func take_damage(amount):
	hp -= amount
	
	hp_changed.emit()
	if hp <= 0:
		get_parent().level_lost.emit()


func _ready() -> void:
	pass
	#_restore_previous_state()


#func _restore_previous_state() -> void:
	#self.hp = SaveData.player_data.hp

func add_exp(e: int):
	experence += e
	exp_changed.emit()
	if experence >= max_exp:
		level_up()
		experence -= max_exp


func level_up():
	level += 1
	player_upgrade.emit()
	

func _on_hitbox_area_entered(_area: Area2D) -> void:
	pass # Replace with function body.

func get_cloest_enemy():
	pass
