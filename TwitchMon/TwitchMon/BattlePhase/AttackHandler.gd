extends Node

onready var friendlyAttackInterface = get_parent().get_node("Interface/LightHeavySpecial")
onready var enemyAttackPicker = get_parent().get_node("Enemy/EnemyAttackPicker")

onready var friendly_attack: int
onready var enemy_attack: int

func _ready():
	friendlyAttackInterface.connect("friendly_attack_queued", self, "_save_friendly_attack")
	enemyAttackPicker.connect("enemy_attack_queued", self, "_save_enemy_attack")
	pass
	

func _save_friendly_attack(damage):
	friendly_attack = damage
	if enemy_attack != 0:
		compare_speeds_and_attack()


func _save_enemy_attack(damage):
	enemy_attack = damage
	if friendly_attack != 0:
		compare_speeds_and_attack()


func compare_speeds_and_attack():
	var enemy_stats = get_parent().get_node("Enemy").get_child(1).get_node("Jobs/Stats")
	var friendly_stats = get_parent().get_node("Friendly").get_child(0).get_node("Jobs/Stats")
	print("[AttackHandler.gd] friendly attack: ", friendly_attack)
	print("[AttackHandler.gd] enemy attack: ", enemy_attack)
	if friendly_stats.speed == enemy_stats.speed:
		print("[AttackHandler.gd] speed the same, friendly has priority")
		enemy_stats.take_damage(friendly_attack)
		friendly_stats.take_damage(enemy_attack)
	elif friendly_stats.speed > enemy_stats.speed:
		print("[AttackHandler.gd] friendly faster")
		enemy_stats.take_damage(friendly_attack)
		friendly_stats.take_damage(enemy_attack)
	else:
		print("[AttackHandler.gd] enemy faster")
		friendly_stats.take_damage(enemy_attack)
		enemy_stats.take_damage(friendly_attack)
	print("[AttackHandler.gd] friendly health: ", friendly_stats.health)
	print("[AttackHandler.gd] enemy health: ", enemy_stats.health)
	reset_attack_values()


func reset_attack_values():
	friendly_attack = 0 
	enemy_attack = 0






