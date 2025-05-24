extends Area2D

@onready var player: CharacterBody2D = get_node("../Player")

var exp: int

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player.add_exp(exp)
		queue_free()
