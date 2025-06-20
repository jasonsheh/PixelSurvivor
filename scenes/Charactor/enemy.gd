extends Charactor

class_name Enemy

@onready var player: Player = get_tree().get_nodes_in_group("Player")[0]
@onready var exp_orb_scene = preload("res://scenes/Item/ExpOrb.tscn")

var state = {
	"speed" = 100,
	"health" = 2,
	"damage" = 1,
	"experience" = 1,
}
var speed: int
var health: int
var damage: int
var experience: int

var actions: Array = ["move"]
var current_action: String = actions[0]

func _ready() -> void:
	# name = state.name
	speed = state.speed
	health = state.health
	damage = state.damage
	experience = state.experience
	%ColorRect.hide()
	# $WorldEnvironment.environment.glow_enabled = true

func _physics_process(delta):
	look_at(player.position)
	# move_to_player
	move_direction = (player.position - self.position).normalized()
	position += move_direction * speed * delta

func action_pattern() -> void:
	pass


func take_damage(amount: int) -> void:
	health -= amount
	%HurtMarker.popup(amount)
	$AnimationPlayer.play("hurt")
	if player.hp_steal != 0:
		player.hp +=  floori(player.hp_steal * amount / 100)
	if health <= 0:
		_on_death()
		queue_free()

func _on_death() -> void:
	var exp_orb = exp_orb_scene.instantiate()
	exp_orb.experience = experience
	exp_orb.global_position = global_position
	get_parent().call_deferred("add_child", exp_orb)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player.take_damage(damage)
		queue_free()


func get_random_spawn_position() -> void:
	return Vector2(
		randf_range(-500, 500), randf_range(-300, 300)
	)



#func face_to_player() -> void:
	#var face_direction = (player.position - self.position).normalized()
	#if face_direction.x > 0 and character_sprite.flip_h:
		#character_sprite.flip_h = false
	#elif face_direction.x < 0 and not character_sprite.flip_h:
		#character_sprite.flip_h = true
