extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var player = get_node("./YSort/Player")
onready var surface = get_node("./YSort/Surface")
onready var overlay = load("res://DebugOverlay/debug_overlay.tscn").instance()
# Called when the node enters the scene tree for the first time.
func _ready():
	overlay.add_stat("Player position (global)", player, "global_position", false)
	overlay.add_stat("Player position (tileMap)", self, "get_tilemap_position",true)
	add_child(overlay)

func _process(delta):	
	pass
	
func get_tilemap_position():
	return surface.world_to_map(player.global_position)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
