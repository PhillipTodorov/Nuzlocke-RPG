extends Node

@onready var dialogue_box = get_parent().get_node("DialogueBox")
@onready var interface = get_parent().get_node("Interface/AttackItemsRunSpirits")
@onready var friendly = get_parent().get_node("Friendly")


func _ready():
	interface.connect("run_pressed", Callable(self, "save_party_stats"))
	pass


func exit_scene():
	dialogue_box.battle_done = true

func save_party_stats():
	Global.save_party()
	pass
