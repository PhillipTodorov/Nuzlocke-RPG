extends Node


@export var startingStats: Resource

@onready var stats = $Stats
@onready var moves = $Moves
@onready var interface = get_tree().get_root().get_node("")

signal health_changed (new_health)
signal max_health_changed (new_max_health)
signal friendly_jobs_instantiated
signal enemy_jobs_instantiated

func _ready():
	stats.initialise(startingStats)
	emit_signal("health_changed", stats.health)
	emit_signal("max_health_changed", stats.max_health)
	
	#print("[Jobs.gd] ",startingStats.spirit_placeholder_dict)
	
	if get_parent().get_parent().name == "Friendly": 
		connect("friendly_jobs_instantiated", Callable(get_tree().get_root().get_node_or_null("BattlePhase/DialogueHandler"), "friendly_stats_initialise"))
		emit_signal("friendly_jobs_instantiated")
	
	elif get_parent().get_parent().name == "Enemy": 
		connect("enemy_jobs_instantiated", Callable(get_tree().get_root().get_node_or_null("BattlePhase/DialogueHandler"), "enemy_stats_initialise"))
		emit_signal("enemy_jobs_instantiated")


func save():
	var save_dict = {
		"filename": get_scene_file_path(),
		"parent": get_parent().get_path(),
		"current_health": stats.health,
		"max_health": stats.max_health,
		"xp": stats.xp,
		"speed": stats.speed,
	}
	Global.party.append(save_dict)
