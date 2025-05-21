extends Charactor

class_name Mob

@onready var player: CharacterBody2D = get_node("../Player")


var speed = 100
var health = 10
var damage = 1
var experience = 0
var level = 1

func _physics_process(delta):
	# move_to_player
	move_direction = (player.position - self.position).normalized()
	position += move_direction * speed * delta


func take_damage(amount):
	health -= amount
	if health <= 0:
		queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player.take_damage(damage)
		queue_free()


func get_random_spawn_position():
	return Vector2(
		randf_range(-500, 500), randf_range(-300, 300)
	)


func _ready() -> void:
	pass
	#_restore_previous_state()



#func face_to_player() -> void:
	#var face_direction = (player.position - self.position).normalized()
	#if face_direction.x > 0 and character_sprite.flip_h:
		#character_sprite.flip_h = false
	#elif face_direction.x < 0 and not character_sprite.flip_h:
		#character_sprite.flip_h = true
