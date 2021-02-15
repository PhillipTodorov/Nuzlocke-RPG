extends TileMap


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var player = get_node('/root/Node2D/Navigation2D/Player')
onready var surface = get_node('/root/Node2D/Navigation2D/Surface')
onready var asset_id_grass_front = tile_set.find_tile_by_name('tileGrassFront')
onready var asset_id_grass_back = tile_set.find_tile_by_name('tileGrass2')
onready var tile_array = []
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var player_offset = Vector2(0,0)
	var radius = 2
	var player_position = world_to_map(player.global_position - global_position - Vector2(0, 10))
	if not player_position in tile_array:
		if surface.get_cell(player_position.x, player_position.y) == asset_id_grass_back:  
			tile_array.append(player_position)
			set_cell(player_position.x, player_position.y, asset_id_grass_front)
	for tile in tile_array:
		if tile.distance_to(player_position) > radius:
			set_cell(tile.x, tile.y, -1)
			tile_array.erase(tile)
	
