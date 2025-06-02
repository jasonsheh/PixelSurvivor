extends VBoxContainer

var init_upgrade_interval: int = 30

@onready var left_time: int = 20 * 60
@onready var left_minute: int = int(left_time / 60)
@onready var left_second: int = left_time % 60
@onready var upgrade_interval: int = init_upgrade_interval 


func _ready() -> void:
	$LeftTime.text = "Survive: %02d:%02d Come On!" % [left_minute, left_second]
	$UpgradeTime.text = "Upgrade Come in: %02d" % upgrade_interval

func _on_timer_timeout() -> void:
	left_time -= 1
	left_minute = int(left_time / 60)
	left_second = left_time % 60
	upgrade_interval -= 1

	if left_time == 0:
		$"../RightContainer/Playtime/Timer".stop()
	if upgrade_interval == 0:
		# generate upgrade
		upgrade_interval = init_upgrade_interval
	
	$LeftTime.text = "Survive: %02d:%02d Come On!" % [left_minute, left_second]
	$UpgradeTime.text = "Upgrade Come in: %02d" % upgrade_interval
