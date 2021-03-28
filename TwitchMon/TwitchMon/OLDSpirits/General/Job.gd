tool
extends Node

class_name job

onready var moveSet = $MoveSet
onready var stats = $Stats

export var startingStats: Resource
export (Array, String) var starting_skills

func _ready():
	pass
