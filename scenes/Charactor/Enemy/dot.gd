extends Enemy

class_name Dot

func _ready() -> void:
	speed = 100
	health = 2
	damage = 1
	experience = 1
	# $WorldEnvironment.environment.glow_enabled = true
