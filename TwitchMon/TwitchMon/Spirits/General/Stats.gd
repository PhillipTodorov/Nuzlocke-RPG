extends Node

onready var max_health: int
onready var speed:int
onready var health: int
onready var xp: int
onready var dialogue_placeholder_dict: Dictionary

signal health_changed (new_health)
signal Friendly_health_depleted
signal Enemy_health_depleted

func initialise(startingStats):
	max_health = startingStats.max_health
	speed = startingStats.speed
	xp = startingStats.xp
	health = max_health
	dialogue_placeholder_dict = startingStats.spirit_placeholder_dict
	pass


func set_max_health(value):
	max_health = max(0, value)


func take_damage(hit):
	health -= hit
	emit_signal("health_changed", health)
	if health <= 0:
		#either 'Enemy' or 'Friendly' '_health_depleted' 
		var spirit_type = String(get_parent().get_parent().get_parent().name)
		connect("Enemy_health_depleted", get_node('/root/BattlePhase/DialogueHandler'), ("Enemy_health_depleted_Dialogue"))
		connect("Friendly_health_depleted", get_node('/root/BattlePhase/DialogueHandler'), ("Friendly_health_depleted_Dialogue"))
		emit_signal(spirit_type + "_health_depleted")

func heal(amount):
	health += amount
	health = min(health, max_health)
	emit_signal("health_changed", health)







