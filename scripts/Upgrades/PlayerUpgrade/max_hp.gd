extends Upgrade

func apply_upgrade(player: Player):
	player.max_hp += 5
	player.hp_changed.emit()
