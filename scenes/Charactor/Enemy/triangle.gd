extends Enemy


func _ready() -> void:
	super._ready()

# Todo dash indicator

func dash() -> void:
	var _speed = speed
	speed *= 5
	await get_tree().create_timer(0.2).timeout
	speed = _speed


func _on_skill_cd_timeout() -> void:
	dash()
