extends ProgressBar

@export var smooth_speed := 5.0  # 平滑过渡速度
@export var flash_duration := 0.2

var _target_ratio := 1.0
var _flash_timer := 0.0

func _ready():
	max_value = %Player.max_hp
	%Player.hp_changed.connect(_on_hp_changed)

#func _process(delta):
	## 平滑过渡效果
	## 受击闪烁效果
	#if _flash_timer > 0:
		#value = lerp(%Player.health, _target_ratio * %Player.max_health, smooth_speed * delta)
		#$DamageFlash.modulate.a = _flash_timer / flash_duration
		#_flash_timer -= delta

#func _on_health_changed(ratio: float):
	#_target_ratio = ratio
	#if ratio < _target_ratio:  # 仅受伤时触发
		#_flash_timer = flash_duration

func _on_hp_changed():
	value = %Player.hp
