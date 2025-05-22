class_name ProjrctileState
extends Resource

@export var texture: Texture2D
@export var speed: int = 300
@export var lifetime: int = 2.0
@export var pierce_count: int = 0  # 穿透次数
@export var homing: bool = false    # 是否追踪
@export var damage_curve : Curve
