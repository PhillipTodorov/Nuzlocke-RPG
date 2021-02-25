extends TileMap

export(String, FILE, "*.tscn") var target_stage

onready var player = get_parent().get_node("Player")
onready var chance_for_encounter = 0.5
onready var tiles_with_tall_grass_id = tile_set.find_tile_by_name('tileGrass2')
onready var tiles_with_tall_grass_array = []


func _ready():
	var current_player_position_tiles = get_players_inhabited_tiles()


func _process(delta):
	grass_encounter()


func grass_encounter():
	var current_player_position_tiles = [get_players_inhabited_tiles()]
	#print(do_these_tiles_have_grass(current_player_position_tiles))
	if do_these_tiles_have_grass(current_player_position_tiles):
		battle_trigger()
		


func battle_trigger():
	var rand = RandomNumberGenerator.new()
	rand.randomize()
	rand = float((rand.randi() % 100)) / 100
	if rand < chance_for_encounter:
		get_tree().change_scene(target_stage)

#returns a Map position (Vector2) of the player
func get_players_inhabited_tiles():
	var players_tile_position = world_to_map(player.global_position)
	return players_tile_position


#returns cell id (int) of the tile at the players position
func get_tile_id_at_this_vector2(tile):
	var current_player_position_tiles = get_players_inhabited_tiles()
	return get_cell(current_player_position_tiles.x, current_player_position_tiles.y)


func do_these_tiles_have_grass(current_player_position_tiles):
	for tile in current_player_position_tiles:
		if get_tile_id_at_this_vector2(tile) == tiles_with_tall_grass_id:
			return true
		else:
			return false

















