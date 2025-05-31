extends Label

signal pharse_changed

var time: int = 0
var minute: int = 0
var second: int = 0
var stopped: bool = false

@export var stage_length: int = 5 # minutes
@export var pharse_length: int = 30 # seconds

func _ready() -> void:
	$Timer.start()
	text = "Time: 00:00"


func _on_timer_timeout() -> void:
	time += 1
	minute = int(time / 60)
	second = time - minute * 60
	text = "Time: %02d:%02d" % [minute, second]
	
	if time % pharse_length == 0:
		$"../../..".pharse += 1
		pharse_changed.emit()
	if minute != 0 and minute % stage_length == 0:
		$"../../..".stage += 1
		$"../../..".pharse = 1
		pharse_changed.emit()
	
