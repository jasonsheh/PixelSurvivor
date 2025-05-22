class_name ProjectileBase
extends CharacterBody2D

# var config : BulletConfig
var state
var speed: int = 200
var damage: int = 0
var lifetime: int = 2
var move_direction: Vector2
var target_pos: Vector2


func _ready() -> void:
	# damage = state.damage
	# position = player_pos
	move_direction = (target_pos - self.position).normalized()
	await get_tree().create_timer(lifetime).timeout
	queue_free()


func _physics_process(delta):
	# move_to_player
	# var direction = Vector2.RIGHT.rotated(rotation)
	position += move_direction * speed * delta
	

func setup(pos: Vector2, dir: Vector2, power: float):
	position = pos
	rotation = dir.angle()
	$Movement.set_direction(dir)

#func _on_lifetime_timeout():
	#queue_free()


func _on_hitbox_body_entered(body: CharacterBody2D) -> void:
	if body.name == "Mob":
		body.take_damage(damage)
		queue_free()
	elif body.name == "Boss":
		pass
