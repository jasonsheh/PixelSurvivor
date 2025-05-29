extends Charactor

class_name Player

signal hp_changed
signal exp_changed

signal player_level_up

# player state
var speed: int = 200
var init_speed:int = 200

var projectile_number: int = 1
var init_projectile_number: int = 1

var armor: int = 1
var init_armor: int = 1

# UI相关
@export var max_hp: int = 10
var init_max_hp: int = 10
@export var hp = 10
var init_hp = 10
@export var max_exp = 9
var init_max_exp = 10
@export var experence = 0
var init_experence = 10

@export var level = 1
var player_upgrades: Array[Upgrade] = []
var projectile_upgrades: Array[Upgrade] = []
var enemy_upgrades: Array[Upgrade] = []

func _physics_process(delta) -> void:
	var input = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	position += input * speed * delta


func take_damage(amount) -> void:
	hp -= amount
	
	hp_changed.emit()
	if hp <= 0:
		get_parent().level_lost.emit()


func _ready() -> void:
	pass
	#_restore_previous_state()


#func _restore_previous_state() -> void:
	#self.hp = SaveData.player_data.hp

func add_exp(e: int) -> void:
	experence += e
	exp_changed.emit()
	if experence >= max_exp:
		level_up()
		experence -= max_exp


func level_up() -> void:
	level += 1
	
	if level <= 15:
		max_exp = 3 * level + 7
	elif level <= 30:
		max_exp = 6 * level - 38
	else:
		max_exp = 12 * level - 158
		
	player_level_up.emit()


func apply_upgrades() -> void:
	# print_player_stat()
	init_player_stat()
	for upgrade in player_upgrades:
		upgrade.apply_upgrade(self)
	# print_player_stat()
	
func init_player_stat() -> void:
	max_hp = init_max_hp

	speed = init_speed
	projectile_number = init_projectile_number
	armor = init_projectile_number
	

func print_player_stat() -> void:
	print("#################")
	print("Speed: ", speed)
	print("Projectile number: ", projectile_number)
	print("Projectile Upgrades: ", projectile_upgrades.size())
	print("#################")


func _on_hitbox_area_entered(_area: Area2D) -> void:
	pass # Replace with function body.

func get_cloest_enemy():
	pass
