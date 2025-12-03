extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
@onready var WorldMap = preload("res://WorldMap/WorldMap.tscn").instantiate()
@onready var BattleScene = preload("res://BattlePhase/BattlePhase.tscn").instantiate()
@onready var debug_overlay = load("res://DebugOverlay/debug_overlay.tscn").instantiate()

# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(WorldMap)
	debug_overlay.add_stat("Player position (global)", $"WorldMap/Node2D/Player", "global_position", false)
	debug_overlay.add_stat("Player position (tileMap)", self, "get_tilemap_position",true)
	$"WorldMap".add_child(debug_overlay)


func get_tilemap_position():
	return $"WorldMap/Node2D/Surface".local_to_map($"WorldMap/Node2D/Player".global_position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
