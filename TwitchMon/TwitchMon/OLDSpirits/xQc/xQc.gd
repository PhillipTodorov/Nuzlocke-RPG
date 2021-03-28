extends Node2D

onready var Spirit = get_node("Spirit")

func _ready():
	Spirit.health = 10
	Spirit.speed = 50
	Spirit.level = 100
	
	Spirit.update_level_label()
	Spirit.update_Speed_label()
	Spirit.update_health_bar()
	print(Spirit.health)
	
	pass
