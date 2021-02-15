extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var max_speed = 400
var speed = 0
var acceleration = 1200
var move_direction = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	MovementLoop(delta)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func MovementLoop(delta):
	move_direction.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	move_direction.y = (int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))) / float(2)
	speed += acceleration * delta
	if speed > max_speed: 
		speed = max_speed
	if move_direction.x == 0 && move_direction.y == 0:
		speed = 0
	var motion = move_direction.normalized() * speed
	move_and_slide(motion)



func _on_Timer_timeout():
	pass # Replace with function body.
