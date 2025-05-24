extends Charactor

class_name Player

signal hp_changed
signal exp_changed
signal level_lost
var speed = 200

# UI相关
var max_hp = 10
var hp = 2
var max_exp = 10
var exp = 0

var level = 1

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
	exp += e
	exp_changed.emit()
	if exp >= max_exp:
		level_up()
		exp -= max_exp


func level_up():
	level += 1


func _on_hitbox_area_entered(area: Area2D) -> void:
	pass # Replace with function body.

func get_cloest_enemy():
	pass
