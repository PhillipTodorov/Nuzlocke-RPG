extends Node

@onready var move_tween = get_parent().get_node("Tween")
@onready var icon = get_parent().get_node("icon")

#if even then 'move_up' should 
#be executed, otherwise,
#execute 'move_down'
@onready var tween_state = 0 
@onready var rng = RandomNumberGenerator.new()



func _ready():
	move_tween.connect("tween_all_completed", Callable(self, "levitate"))
	await get_tree().create_timer(rng.randf()).timeout
	levitate()
	pass



func levitate():
	if tween_state % 2 == 0: 
		move_up()
	else:
		move_down()
	tween_state += 1



func move_up():
	move_tween.interpolate_property(icon, "offset", icon.offset, Vector2(0,-10), 2, Tween.EASE_IN, Tween.EASE_OUT)
	move_tween.start()



func move_down():
	move_tween.interpolate_property(icon, "offset", icon.offset, Vector2(0,15), 2, Tween.EASE_IN, Tween.EASE_OUT)
	move_tween.start()

