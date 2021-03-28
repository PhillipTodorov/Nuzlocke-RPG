extends Node2D

export onready var level: int
export onready var health = 0
export onready var speed: int
onready var damage: int

export var starting_stats: Resource

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

func update_level_label():
	$Level.text = "Level:" + String(level)
	pass

func update_Speed_label():
	$Speed.text = "Speed:" + String(speed)
	pass

#this should be triggered whenever the health variable is updated
func update_health_bar():
	$HealthBar._on_health_updated(health)
	pass
