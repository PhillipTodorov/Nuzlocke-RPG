extends Node

onready var RNG_number: float

onready var michael = "res://Spirits/Michael.tscn"
onready var xqc = "res://Spirits/xQc.tscn"
onready var poki = "res://Spirits/Poki.tscn"

onready var list_of_spirits = {michael: 23, xqc: 7, poki: 3}

onready var tasks: int

func _ready():
	tasks = 0
	list_of_spirits = list_of_spirits_normalised(list_of_spirits)
	print(list_of_spirits)
	list_of_spirits = list_of_spirits_cumulative_odds(list_of_spirits)
	print(list_of_spirits)
	twitchmon_randomizer()
	$Friendly.connect("friendly_action_queued", self, "compare_speed")
	#TODO $Enemy.connect("enemy_action_queued", self, "compare_speed")


func compare_speed():
	if tasks == 2:
		block_input()
#		if enemy.speed > friendly.speed:
#			#execute enemy action first
#			pass
#		else:
#			#execute friendly action  first
#			pass
		pass
		unblock_input()
	pass


func twitchmon_randomizer():
	RNG_number = randf()
	print(RNG_number)
	
	for spirit in list_of_spirits:
		if list_of_spirits[spirit] > RNG_number:
			print(spirit)
			$Enemy.add_child(load(spirit).instance())
			break


func list_of_spirits_normalised(list_of_spirits):
	var LoS_sum = 0
	
	for item in list_of_spirits:
		LoS_sum += list_of_spirits[item] 
		
	for item in list_of_spirits:
		list_of_spirits[item] = float(list_of_spirits[item]) / LoS_sum
		
	return list_of_spirits
	

func list_of_spirits_cumulative_odds(list_of_spirits):
	var spirit_keys = list_of_spirits.keys()
	for i in spirit_keys.size(): 
		if i > 0:
			list_of_spirits[spirit_keys[i]] += list_of_spirits[spirit_keys[i-1]]
	return list_of_spirits

func block_input():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$"Friendly/Interface".visible == false
	pass
	
func unblock_input():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$"Friendly/Interface".visible == true
	pass
