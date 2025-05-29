extends Label

var time: int = 0
var minute: int = 0
var second: int = 0
var stopped: bool = false

func _ready() -> void:
	$Timer.start()
	text = "Time: 00:00"


func _on_timer_timeout() -> void:
	time += 1
	minute = int(time / 60)
	second = time - minute * 60
	text = "Time: %02d:%02d" % [minute, second]
