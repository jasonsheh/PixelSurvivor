extends Camera2D

func _ready() -> void:
	var viewport = get_viewport().get_visible_rect()
	limit_left = 0
	limit_right = viewport.size.x
	
	limit_top = 0
	limit_bottom = viewport.size.y
