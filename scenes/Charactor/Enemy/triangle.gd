extends Enemy


func _ready() -> void:
	speed = 110
	health = 3
	damage = 1
	experience = 2
	# $WorldEnvironment.environment.glow_enabled = true


func dash() -> void:
	var _speed = speed
	speed *= 5
	await get_tree().create_timer(0.2).timeout
	speed = _speed


func _on_skill_cd_timeout() -> void:
	dash()
