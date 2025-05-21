extends CharacterBody2D

class_name Charactor

const FRICTION: float = 0.16
const accerelation: int = 200

var MAX_SPEED: int = 200
var PLAYER_MAX_SPEED: int = 200

#@export var max_hp:int = 100
#@export var hp:int = 100: set = set_hp
#signal hp_changed(new_hp, max_hp)

#var JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
# var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var move_direction: Vector2 = Vector2.ZERO

#@onready var state_machine: Node = get_node("FiniteStateMachine")

func _physics_process(_delta: float) -> void:
	pass


func move(delta) -> void:
	# velocity.x = move_direction * speed
	velocity.x += move_direction.x * accerelation
	velocity.y += move_direction.y * accerelation

	
#func take_damage(damage: int, direction: Vector2, force: int) -> void:
	#if state_machine.state != state_machine.states.hurt:
		#self.hp -= damage
		#
		#var _damage_indicator = damage_indicator.instantiate()
		#add_child(_damage_indicator)
		#_damage_indicator.label.text = str(damage)
		#
		#if name == "Player":
			#SaveData.player_data.hp = hp
		#if hp > 0:
			#state_machine.set_state(state_machine.states.hurt)
			#velocity.x += direction.x * force
		#else:
			#state_machine.set_state(state_machine.states.death)
			#velocity.x += direction.x * force * 1.5


#func set_hp(new_hp: int) -> void:
	#hp = clamp(new_hp, 0, max_hp)
	#emit_signal("hp_changed", hp, max_hp)
