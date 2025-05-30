@tool
extends Node


func get_random_rarity(rarity: Dictionary[String, int]) -> String:
	var chance: int = randi_range(1, 100)
	var sum: int = 0
	for i in range(rarity.size()):
		sum += rarity.values()[i]
		if sum > chance:
			return rarity.keys()[i]
	return rarity.keys()[-1]
