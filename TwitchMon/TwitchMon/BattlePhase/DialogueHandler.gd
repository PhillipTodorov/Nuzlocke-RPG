extends Node

@onready var friendlyAttackInterface = get_parent().get_node("Interface/LightHeavySpecial")
@onready var enemyAttackPicker = get_parent().get_node("Enemy/EnemyAttackPicker")

@onready var dialogue_box = get_parent().get_node("DialogueBox")
@onready var interface = get_parent().get_node("Interface")
@onready var scene_handler = get_parent().get_node("SceneHandler")


@export var dialogue_file_path: String # (String, FILE, "*.json")

var enemy_stats = ""
var friendly_stats = ""
var friendly_attack_name
var enemy_attack_name
var stats_counter = 0

#a combination of Friendly and Enemy spirit "dialogue_placeholder_dict". So
#{"friendly_name" : Friendly.spirit_name,
#"enemy_name" : Enemy.spirit_name}
var scene_dialogue_dict: Dictionary

func _ready():
	dialogue_box.connect("line_displayed", Callable(self, "dialogue_logic"))
	interface.get_node("AttackItemsRunSpirits").connect("attack_items_run_spirits_pressed", 
	Callable(self, "attack_items_run_spirits_pressed_dialogue_logic"))
	friendlyAttackInterface.connect("friendly_attack_queued", Callable(self, "_save_friendly_attack_name"))
	enemyAttackPicker.connect("enemy_attack_queued", Callable(self, "_save_enemy_attack_name"))
	


func enemy_stats_initialise():
	enemy_stats = get_tree().get_root().get_node("BattlePhase/Enemy/").get_child(1).get_node("Jobs/Stats")
	enemy_stats.connect("Enemy_health_depleted", Callable(self, "Enemy_health_depleted_Dialogue"))
	stats_counter += 1
	if stats_counter == 2:
		dialogue_start()
	print("[DialogueHandler.gd] enemy stats initialised ")


func friendly_stats_initialise():	
	friendly_stats = get_tree().get_root().get_node("BattlePhase/Friendly/").get_child(0).get_node("Jobs/Stats")
	friendly_stats.connect("Friendly_health_depleted", Callable(self, "Friendly_health_depleted_Dialogue"))
	stats_counter += 1
	if stats_counter == 2:
		dialogue_start()
	print("[DialogueHandler.gd] friendly stats initialised ")


func initialise_scene_dialogue_dict():
	for key in friendly_stats.dialogue_placeholder_dict:
		scene_dialogue_dict["Friendly_" + key] = friendly_stats.dialogue_placeholder_dict[key]

	for key in enemy_stats.dialogue_placeholder_dict:
		scene_dialogue_dict["Enemy_" + key] = enemy_stats.dialogue_placeholder_dict[key]

	print("[DialogueHandler.gd] scene_dialogue_dict: ", scene_dialogue_dict)
	return scene_dialogue_dict


func dialogue_start():
	if stats_counter == 2:
		dialogue_box.dialogue_file_path = dialogue_file_path
		dialogue_box.dialogue_placeholder_dict = initialise_scene_dialogue_dict()
		
		dialogue_box.start()


#when each line of dialogue is displayed in dialogue, a 
#'line_displayed' signal is sent along with the 'index' 
#of the line and checks if theres any addition actions 
#that need to be taken alongside the text display
func dialogue_logic(key):
	print("[DialogueHandler.gd] dialogue logic executed")
	print("[DialogueHandler.gd] KEY:", key)
	if key == "battlephase_start_1":
		dialogue_box.interface.show()
		dialogue_box.button_next.hide()


func attack_items_run_spirits_pressed_dialogue_logic():
	dialogue_box.hide()
	pass

func Enemy_health_depleted_Dialogue():
	dialogue_box.display("enemy_health_depleted_", 0)
	scene_handler.exit_scene()

func Friendly_health_depleted_Dialogue():
	dialogue_box.display("friendly_health_depleted_", 0)
	scene_handler.exit_scene()

func _save_friendly_attack_name(attack, __):
	friendly_attack_name = attack


func _save_enemy_attack_name(attack, __):
	enemy_attack_name = attack
