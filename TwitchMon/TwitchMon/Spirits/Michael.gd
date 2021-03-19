extends Node2D

onready var Spirit = get_node("Spirit")

func _ready():
	Spirit.health = 100
	Spirit.speed = 100
	Spirit.level = 100
	
	Spirit.update_level_label()
	Spirit.update_Speed_label()
	pass
