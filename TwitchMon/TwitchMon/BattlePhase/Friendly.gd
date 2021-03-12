extends Node2D

onready var battlePhase = get_parent()

signal friendly_action_queued

func _ready():
	$Interface/LightHeavySpecial.connect("action_queued", self, "friendly_action")
	pass # Replace with function body.

func friendly_action():
	start()
	print("start ", battlePhase.tasks)
	content()
	end()
	print("end ", battlePhase.tasks)
	emit_signal("friendly_action_queued")
	pass
	
func start():
	# add 1 from BattlePhase.tasks
	battlePhase.tasks += 1
	pass
	
func content():
	print($Interface/LightHeavySpecial.damageQueued, " damage done") 
	pass
	
func end():
	# subtract 1 from BattlePhase.tasks
	battlePhase.tasks -= 1
	pass
