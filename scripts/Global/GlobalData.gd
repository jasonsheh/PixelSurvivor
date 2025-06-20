class_name GlobalData
extends Node

static var Rarity: Dictionary[String, int] = {
	"normal": 50,
	"magic": 30,
	"rare": 15,
	"unique": 5,
}

static var rarity_chance: Array = [
	50,
	30,
	15,
	5,
]

static var rarity_color: Dictionary[String, String] = {
	"normal": "ivory",
	"magic": "dodger_blue",
	"rare": "gold",
	"unique": "crimson",
}
