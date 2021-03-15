extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$"YSort/Player".global_position = Global.player_position
	pass

func _process(delta):	
	if $AudioStreamPlayer.playing == false:
		$AudioStreamPlayer.set_volume_db(linear2db(100))
		$AudioStreamPlayer.play()
	pass
	




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
