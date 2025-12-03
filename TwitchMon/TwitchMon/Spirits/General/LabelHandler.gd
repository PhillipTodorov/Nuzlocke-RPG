extends Node

@onready var hp = get_parent().get_node("HealthBar/HP")
func update_hp_label(amount):
	hp.text = "HP: " + String(max(0,amount))
