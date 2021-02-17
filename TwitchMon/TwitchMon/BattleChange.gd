extends Area2D


export(String, FILE, "*.tscn") var target_stage

onready var chance_for_encounter = 1

func _ready():
	pass # Replace with function body.


func _on_BattleChange_body_entered(body):
	if "Player" in body.name:
		var rand = float((randi() % 100)) / 100
		print(rand)
		print(chance_for_encounter)
		if rand < chance_for_encounter:
			get_tree().change_scene(target_stage)
