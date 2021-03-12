extends Node

onready var moveSet = ["heavy", "light", "special"]
onready var target #which player is being attacked (either enemy or friendly)

func _ready():
	var chosenMove = moveSet[randi() % 2]
	
	if chosenMove == "heavy":
		heavy()
	elif chosenMove == "light":
		light()
	elif chosenMove == "special":
		special()
		
#when damage is done, set damage done value to appropriate value along with target, it is then read by battlephase to then do the damage to 
func heavy():
	pass
	
func light():
	pass
	
func special():
	pass

