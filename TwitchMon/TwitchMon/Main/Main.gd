extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var WorldMap = preload("res://WorldMap/WorldMap.tscn").instance()
onready var BattleScene = preload("res://BattlePhase/BattlePhase.tscn").instance()
onready var debug_overlay = load("res://DebugOverlay/debug_overlay.tscn").instance()

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(WorldMap)
	debug_overlay.add_stat("Player position (global)", $"WorldMap/YSort/Player", "global_position", false)
	debug_overlay.add_stat("Player position (tileMap)", self, "get_tilemap_position",true)
	$"WorldMap".add_child(debug_overlay)


func get_tilemap_position():
	return $"WorldMap/YSort/Surface".world_to_map($"WorldMap/YSort/Player".global_position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
