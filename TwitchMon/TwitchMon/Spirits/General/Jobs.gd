extends Node


export var startingStats: Resource

onready var stats = $Stats
onready var moves = $Moves

signal health_changed (new_health)

func _ready():
	stats.initialise(startingStats)
	emit_signal("health_changed", stats.health)
	pass
