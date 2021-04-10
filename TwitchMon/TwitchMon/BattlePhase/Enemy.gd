extends Node

onready var RNG_number: float

onready var michael = "res://Spirits/Michael/Michael.tscn"
onready var xqc = "res://Spirits/xQc/xQc.tscn"
onready var poki = "res://Spirits/Poki/Poki.tscn"
onready var general = "res://Spirits/General/Spirit.tscn"

onready var list_of_spirits = {
	michael: 1, 
	xqc: 1, 
	poki: 1, 
	general: 1
	}

func _ready():
	list_of_spirits = list_of_spirits_normalised(list_of_spirits)
	#print("[Enemy.gd] ",list_of_spirits)
	list_of_spirits = list_of_spirits_cumulative_odds(list_of_spirits)
	#print("[Enemy.gd] ",list_of_spirits)
	twitchmon_randomizer()
	pass


func twitchmon_randomizer():
	RNG_number = randf()
	#print("[Enemy.gd] RNG number: ",RNG_number)
	
	for spirit in list_of_spirits:
		if list_of_spirits[spirit] > RNG_number:
		#	print("[Enemy.gd] ",spirit)
			self.add_child(load(spirit).instance())
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
