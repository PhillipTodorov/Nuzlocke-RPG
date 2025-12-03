@tool
extends Node

class_name job

@onready var moveSet = $MoveSet
@onready var stats = $Stats

@export var startingStats: Resource
@export var starting_skills # (Array, String)

func _ready():
	pass
