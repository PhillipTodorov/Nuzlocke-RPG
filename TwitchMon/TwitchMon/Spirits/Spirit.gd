extends Node2D


onready var level
onready var health = $"HealthBar/HealthBar".value

# Called when the node enters the scene tree for the first time.
func _ready():
	level = 5
	health = 100
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
