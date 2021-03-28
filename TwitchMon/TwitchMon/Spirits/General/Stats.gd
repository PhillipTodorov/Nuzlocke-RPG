extends Node

onready var max_health: int
onready var speed:int
onready var health: int

signal health_changed (new_health)

func initialise(startingStats):
	max_health = startingStats.max_health
	speed = startingStats.speed
	health = max_health
	pass


func set_max_health(value):
	max_health = max(0, value)


func take_damage(hit):
	health -= hit
	emit_signal("health_changed", health)
	if health <= 0:
		emit_signal("heath_depleted")


func heal(amount):
	health += amount
	health = min(health, max_health)
	emit_signal("health_changed", health)







