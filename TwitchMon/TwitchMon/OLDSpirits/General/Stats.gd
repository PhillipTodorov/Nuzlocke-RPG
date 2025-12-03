extends Node

var speed: int
var max_health: int: set = set_max_health
var health: int 

func _ready():
	pass # Replace with function body.

func initialise(startingStats: StartingStats):
	speed = startingStats.speed
	max_health = startingStats.max_health
	health = max_health


func set_max_health(value):
	max_health = max(0, value)
	
func take_damage(hit):
	health -= hit
	emit_signal("health_changed", health)
	if health == 0: 
		emit_signal("health_depleted")
