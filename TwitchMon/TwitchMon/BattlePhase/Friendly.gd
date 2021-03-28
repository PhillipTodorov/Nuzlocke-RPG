extends Node


func _ready():
	self.add_child(load("res://Spirits/General/Spirit.tscn").instance())
	pass
