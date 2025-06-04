extends Charactor

class_name Player

signal hp_changed
signal exp_changed

signal player_level_up

# 初始属性配置
const INIT_SPEED: int = 40
const INIT_PROJECTILE_NUMBER: int = 1
const INIT_ARMOR: int = 1
const INIT_MAX_HP: int = 10
const INIT_HP_REGEN: int = 1
const INIT_MAX_EXP: int = 9
const INIT_MAX_LEVEL: int = 50

@export var speed: int = INIT_SPEED
@export var attack_speed: int = 1


@export var projectile_number: int = INIT_PROJECTILE_NUMBER

@export var armor: int = INIT_ARMOR

@export var max_hp: int = INIT_MAX_HP
@export var hp: int = INIT_MAX_HP
@export var hp_regen: int = INIT_HP_REGEN
@export var hp_steal: int = 0

@export var max_exp: int = INIT_MAX_EXP
@export var experience: int = 0
@export var level: int = 1

var player_upgrades: Array[Upgrade] = []
var projectile_upgrades: Array[Upgrade] = []
var enemy_upgrades: Array[Upgrade] = []

func _physics_process(delta) -> void:
	move_and_slide()
	#velocity = Vector2.ZERO
	
	move_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	velocity.x += move_direction.x * speed
	velocity.y += move_direction.y * speed
	velocity = lerp(velocity, Vector2.ZERO, FRICTION)
	velocity = clamp(velocity, -MAX_SPEED, MAX_SPEED)

	if abs(velocity.x) < 10:
		velocity.x = 0
	if abs(velocity.y) < 10:
		velocity.y = 0
		
	#move_and_collide(velocity)
	
	#var move_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	#position += move_direction * speed * delta


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
	experience += e
	if experience >= max_exp:
		experience -= max_exp
		level_up()
	
	exp_changed.emit()


func level_up() -> void:
	level += 1
	# 更新经验需求公式
	if level <= 15:
		max_exp = 5 * level + 7
	elif level <= 30:
		max_exp = 10 * level - 38
	else:
		max_exp = 20 * level - 158
		
	player_level_up.emit()

func apply_upgrades() -> void:
	# print_player_stat()
	init_player_stat()
	for upgrade in player_upgrades:
		upgrade.apply_upgrade(self)
	# print_player_stat()
	
func init_player_stat() -> void:
	max_hp = INIT_MAX_HP
	speed = INIT_SPEED
	projectile_number = INIT_PROJECTILE_NUMBER
	armor = INIT_PROJECTILE_NUMBER
	
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
