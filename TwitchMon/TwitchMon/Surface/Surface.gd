extends TileMap
# This script handles overworld tile encounters (like Pokémon tall grass)
# and scene transitions when a random encounter triggers.

#------------------------------------------------------------
# Inspector-exposed variables
#------------------------------------------------------------
@export_file("*.tscn") var target_stage: String = ""
# Scene to load when a random encounter starts.

#------------------------------------------------------------
# Runtime variables
#------------------------------------------------------------
@onready var player = get_parent().get_node("Player")
# Reference to the Player node in the same parent scene.
# Make sure the Player node name exactly matches this.

@onready var chance_for_encounter = 0.05
# 5% chance per movement frame while standing in tall grass.

#------------------------------------------------------------
# Built-in callbacks
#------------------------------------------------------------
func _ready():
	# This runs once when the TileMap enters the scene tree.
	var ts := tile_set
	for source_i in range(ts.get_source_count()):
		var source_id = ts.get_source_id(source_i)
		var source = ts.get_source(source_id)
		if source is TileSetAtlasSource:
			for j in range(source.get_tiles_count()):
				var tile_id = source.get_tile_id(j)
				print(source_id, tile_id, source.get_name())

	print("Surface.gd ready — using custom tile data for encounters.")
	var current_player_position_tiles = get_players_inhabited_tiles()
	# No visual logic here; just confirming the script runs.
	

func _process(delta):
	# Called every frame. Checks for possible encounters.
	grass_encounter()

#------------------------------------------------------------
# Encounter logic
#------------------------------------------------------------
func grass_encounter():
	# Get the player’s current tile position (in grid coordinates)
	var current_player_position_tiles = [get_players_inhabited_tiles()]
	# If any of those tiles have custom data 'encounter = true'
	if do_these_tiles_have_grass(current_player_position_tiles):
		battle_trigger()

func battle_trigger():
	# Random number 0-1 to decide whether an encounter happens.
	var rand = RandomNumberGenerator.new()
	rand.randomize()
	var roll = float(rand.randi() % 100) / 100.0

	# Only trigger if under chance threshold and player is moving.
	if roll < chance_for_encounter and (player.move_direction.x != 0 or player.move_direction.y != 0):
		if target_stage != "":
			get_tree().change_scene_to_file(target_stage)
		else:
			push_error("target_stage is empty — set it in the Inspector!")

#------------------------------------------------------------
# Helper functions
#------------------------------------------------------------
func get_players_inhabited_tiles() -> Vector2i:
	# Convert global player position to tilemap coordinates
	return local_to_map(Global.player_position)

func get_tile_info_at_this_vector2(cell: Vector2i) -> bool:
	# Returns whether this tile has encounter grass.
	var tile_data := get_cell_tile_data(0, cell)
	if tile_data == null:
		return false
	# The "encounter" custom data layer is set to true for tall-grass tiles.
	return tile_data.get_custom_data("encounter")

func do_these_tiles_have_grass(tile_list: Array) -> bool:
	# Checks if any tile in the given list is tall grass.
	for cell in tile_list:
		if get_tile_info_at_this_vector2(cell):
			return true
	return false
