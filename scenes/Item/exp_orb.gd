extends Area2D

@onready var player: CharacterBody2D = get_node("../Player")

var experence: int
var speed: int = 400
var is_player_entered: bool = false

func _physics_process(delta):
	# move_to_player
	if is_player_entered:
		var move_direction = (player.position - self.position).normalized()
		position += move_direction * speed * delta


func set_experience(new_exp: int):
	experence = new_exp


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player.add_exp(experence)
		queue_free()


func _on_disapper_timer_timeout() -> void:
	queue_free()
