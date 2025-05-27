extends Area2D


#func _on_body_entered(body: Node2D) -> void:
	#print(body.name)
	#if body.name == "ExpOrb":
		#print(1)
		#body.is_player_entered = true


func _on_area_entered(area: Area2D) -> void:
	if area.has_method("set_experience"):
		area.is_player_entered = true
