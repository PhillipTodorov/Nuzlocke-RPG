extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var ray = $RayCast2D
var grid_size = 16
var inputs = {
	'ui_up' : Vector2.UP,
	'ui_down' : Vector2.DOWN,
	'ui_left' : Vector2.LEFT,
	'ui_right' : Vector2.RIGHT,
}


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _unhandled_input(event):
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)


func move(dir):
	var vector_pos = inputs[dir] * grid_size
	ray.cast_to = vector_pos
	ray.force_raycast_update()
	if !ray.is_colliding():
		position += inputs[dir] * grid_size
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
