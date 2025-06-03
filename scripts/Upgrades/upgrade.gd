class_name Upgrade
extends Resource

@export var icon: Texture
@export_enum("normal", "magic", "rare", "unique") var rarity: String
@export_enum("projectile", "player", "enemy") var type: String
@export var name = ""
@export_multiline var desription = ""


func apply_upgrade(_node):
	pass
