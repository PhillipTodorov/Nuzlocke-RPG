extends Node

onready var dialogue_box = get_parent().get_node("DialogueBox")

func exit_scene():
#	TODO: save_party_stats()
	dialogue_box.battle_done = true
