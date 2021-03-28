extends Node

onready var friendlyAttackInterface = get_parent().get_parent().get_node("Interface/LightHeavySpecial")

signal enemy_attack_queued(damage)


func _ready():
	friendlyAttackInterface.connect("friendly_attack_queued", self, "randomAttackPicker")


func randomAttackPicker(damage):
	
	var RNG_Picker = randi() % 3
	
	print("[EnemyAttackPicker.gd] rng picker: ", RNG_Picker)
	
	if RNG_Picker == 0:
		emit_signal("enemy_attack_queued", 10)
		
	if RNG_Picker == 1:
		emit_signal("enemy_attack_queued", 20)

	if RNG_Picker == 2:
		emit_signal("enemy_attack_queued", 30)
		
