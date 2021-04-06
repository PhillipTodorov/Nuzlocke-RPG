extends Node


export var startingStats: Resource

onready var stats = $Stats
onready var moves = $Moves

signal health_changed (new_health)
signal friendly_jobs_instantiated
signal enemy_jobs_instantiated

func _ready():
	stats.initialise(startingStats)
	emit_signal("health_changed", stats.health)
	#print("[Jobs.gd] ",startingStats.spirit_placeholder_dict)
	
	if get_parent().get_parent().name == "Friendly": 
		connect("friendly_jobs_instantiated", get_tree().get_root().get_node_or_null("BattlePhase/DialogueHandler"), "friendly_stats_initialise")
		emit_signal("friendly_jobs_instantiated")
	
	elif get_parent().get_parent().name == "Enemy": 
		connect("enemy_jobs_instantiated", get_tree().get_root().get_node_or_null("BattlePhase/DialogueHandler"), "enemy_stats_initialise")
		emit_signal("enemy_jobs_instantiated")
