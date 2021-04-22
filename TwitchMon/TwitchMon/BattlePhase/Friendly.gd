extends Node

func _ready():
	self.add_child(load(get_first_party_member()).instance())
	pass

func get_first_party_member():
	return Global.party[0]
