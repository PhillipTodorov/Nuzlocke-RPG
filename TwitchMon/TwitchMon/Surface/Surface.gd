extends TileMap

@export_file("*.tscn") var target_stage: String = ""

@onready var player = get_parent().get_node("Player")
@onready var chance_for_encounter = 0.05
@onready var tiles_with_tall_grass_id = tile_set.find_tile_by_name('tileGrass2')
@onready var tiles_with_tall_grass_array = []


func _ready():
	var current_player_position_tiles = get_players_inhabited_tiles()


func _process(delta):
	grass_encounter()


func grass_encounter():
	var current_player_position_tiles = [get_players_inhabited_tiles()] 
	if do_these_tiles_have_grass(current_player_position_tiles):
		battle_trigger()

func battle_trigger():
	var rand = RandomNumberGenerator.new()
	rand.randomize()
	rand = float((rand.randi() % 100)) / 100
	if rand < chance_for_encounter and (player.move_direction.x > 0 or player.move_direction.y > 0):
		get_tree().change_scene_to_file(target_stage)
	else:
		push_error("target_stage is empty — set it in the Inspector!")


# Returns the player's tile position as a Vector2i
func get_players_inhabited_tiles() -> Vector2i:
	return local_to_map(Global.player_position)

# Returns cell ID of a given tile
func get_tile_id_at_this_vector2(tile: Vector2i) -> int:
	# layer 0 is assumed; change if you use multiple layers
	return get_cell_source_id(0, tile)

func do_these_tiles_have_grass(tile_list: Array) -> bool:
	for tile in tile_list:
		# ensure tile is a Vector2i (from local_to_map / world_to_map)
		if get_tile_id_at_this_vector2(tile) == tiles_with_tall_grass_id:
			return true
	# only return false after checking all tiles
	return false
