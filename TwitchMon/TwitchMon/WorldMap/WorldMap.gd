extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var player = get_node("./YSort/Player")

# Called when the node enters the scene tree for the first time.
func _ready():
	print(player.global_position)
	var overlay = load("res://DebugOverlay/debug_overlay.tscn").instance()
	overlay.add_stat("Player position", player, "global_position", false)
	add_child(overlay)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
