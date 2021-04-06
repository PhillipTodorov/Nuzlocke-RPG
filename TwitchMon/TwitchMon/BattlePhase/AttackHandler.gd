extends Node

onready var friendlyAttackInterface = get_parent().get_node("Interface/LightHeavySpecial")
onready var enemyAttackPicker = get_parent().get_node("Enemy/EnemyAttackPicker")

onready var friendly_attack: String
onready var enemy_attack: String
onready var friendly_damage: int
onready var enemy_damage: int

func _ready():
	friendlyAttackInterface.connect("friendly_attack_queued", self, "_save_friendly_attack")
	enemyAttackPicker.connect("enemy_attack_queued", self, "_save_enemy_attack")
	pass
	

func _save_friendly_attack(attack, damage):
	friendly_attack = attack
	friendly_damage = damage
	if enemy_damage != 0:
		compare_speeds_and_attack()


func _save_enemy_attack(attack, damage):
	enemy_attack = attack
	enemy_damage = damage
	if friendly_damage != 0:
		compare_speeds_and_attack()


func compare_speeds_and_attack():
	var enemy_stats = get_parent().get_node("Enemy").get_child(1).get_node("Jobs/Stats")
	var friendly_stats = get_parent().get_node("Friendly").get_child(0).get_node("Jobs/Stats")
	print("[AttackHandler.gd] friendly attack: ", friendly_attack)
	print("[AttackHandler.gd] enemy attack: ", enemy_attack)
	if friendly_stats.speed == enemy_stats.speed:
		
		print("[AttackHandler.gd] speed the same, friendly has priority")
		enemy_stats.take_damage(friendly_damage)
		friendly_stats.take_damage(enemy_damage)
	elif friendly_stats.speed > enemy_stats.speed:
		print("[AttackHandler.gd] friendly faster")
		enemy_stats.take_damage(friendly_damage)
		friendly_stats.take_damage(enemy_damage)
	else:
		print("[AttackHandler.gd] enemy faster")
		friendly_stats.take_damage(enemy_attack)
		enemy_stats.take_damage(enemy_damage)
	print("[AttackHandler.gd] friendly health: ", friendly_stats.health)
	print("[AttackHandler.gd] enemy health: ", enemy_stats.health)
	reset_attack_values()


func reset_attack_values():
	friendly_attack = ""
	enemy_attack = ""
	friendly_damage = 0 
	enemy_damage = 0 







