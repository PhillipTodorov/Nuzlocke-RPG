extends Node

@onready var friendlyAttackInterface = get_parent().get_parent().get_node("Interface/LightHeavySpecial")

signal enemy_attack_queued(attack, damage)


func _ready():
	friendlyAttackInterface.connect("friendly_attack_queued", Callable(self, "randomAttackPicker"))


func randomAttackPicker(attack, damage):
	
	var RNG_Picker = randi() % 3
	
	print("[EnemyAttackPicker.gd] rng picker: ", RNG_Picker)
	
	if RNG_Picker == 0:
		emit_signal("enemy_attack_queued", "Light3D", 10)
		
	if RNG_Picker == 1:
		emit_signal("enemy_attack_queued", "Heavy", 20)

	if RNG_Picker == 2:
		emit_signal("enemy_attack_queued", "Special", 30)
		
