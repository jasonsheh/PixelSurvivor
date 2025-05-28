class_name ProjectileBase
extends Area2D

# var config : BulletConfig
var state
var speed: int = 200
var damage: int = 5
var lifetime: int = 2
var pierce_count: int = 1

var move_direction: Vector2
var target_pos: Vector2



func _ready() -> void:
	set_projectile_state()
	move_direction = (target_pos - position).normalized()
	%LifeTimer.start(lifetime)


func set_projectile_state() -> void:
	speed = state.speed
	damage = state.damage
	lifetime = state.lifetime
	pierce_count = state.pierce_count
	

func _physics_process(delta):
	# move_to_player
	# var direction = Vector2.RIGHT.rotated(rotation)
	position += move_direction * speed * delta


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		# print(pierce_count)
		body.take_damage(damage)
		pierce_count -= 1
		if pierce_count < 0:
			queue_free()
	elif body.name == "Boss":
		pass


func _on_life_timer_timeout() -> void:
	queue_free() # Replace with function body.
