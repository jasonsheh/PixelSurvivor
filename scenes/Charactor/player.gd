extends Charactor

class_name Player

var speed = 200
var health = 100
var experience = 0
var level = 1

func _physics_process(delta):
	var input = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	position += input * speed * delta

func take_damage(amount):
	health -= amount
	if health <= 0:
		pass


func _ready() -> void:
	pass
	#_restore_previous_state()


#func _restore_previous_state() -> void:
	#self.hp = SaveData.player_data.hp


func _on_hitbox_area_entered(area: Area2D) -> void:
	pass # Replace with function body.

func get_cloest_enemy():
	pass
