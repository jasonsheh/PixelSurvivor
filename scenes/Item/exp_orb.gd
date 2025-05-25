extends Area2D

@onready var player: CharacterBody2D = get_node("../Player")

var experence: int

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player.add_exp(experence)
		queue_free()
