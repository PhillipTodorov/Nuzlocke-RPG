extends Node

@onready var player = get_node("root/Player")
@onready var game_save_class = "res://GameSave/GameSave.gd"

var player_position = Vector2(0,0)

var poki = "res://Spirits/Poki/Poki.tscn"

var party = [
		
			poki 
		
	]

func save_party():
	var new_save = preload("res://GameSave/GameSave.gd").new()
	new_save.party = party
	
	ResourceSaver.save(new_save, "res://Saves/PartyData.tres")
	
	
func load_party():
	pass

func verify_party():
	pass
