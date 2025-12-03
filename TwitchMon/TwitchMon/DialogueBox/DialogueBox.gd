extends Control

signal dialogue_ended()
signal line_displayed(index)

@onready var dialogue_player = get_node("DialoguePlayer")

@onready var label_text = get_node("Text") as Label
@onready var button_next = get_node("Next") as Button
@onready var button_done = get_node("Done") as Button

@onready var interface = get_tree().get_root().get_node("Interface")

var dialogue_key_prefix: String
var battle_done = false

var dialogue_file_path: String
var dialogue_placeholder_dict: Dictionary


func _ready():
	dialogue_player.connect("dialogue_loaded", Callable(self, "_display_text_process"))

#grabs focus to text box, hides and shows the correct buttons 
func start():
	label_text = get_node("Text") as Label
	button_next = get_node("Next") as Button
	button_done = get_node("Done") as Button
	dialogue_player = get_node("DialoguePlayer")
	print("[DialogueBox.gd] dialogue has started")
	button_done.hide()
	button_next.show()
	button_next.grab_focus()
	
	dialogue_player.load_dialogue(dialogue_file_path)
	
	display("battlephase_start_", 0)


#displays the text at the current index of the json file
func display(key,index):
	self.show()
	dialogue_key_prefix = key 
	label_text.text = dialogue_player.read_dialogue(key,index)


#First the dialogue player index gets updated to the next 
#line, THEN, the line's content gets displayed
func _on_Next_pressed():
	interface = get_tree().get_root().get_node("BattlePhase/Interface")
	if dialogue_player.key_exists(dialogue_key_prefix + String(dialogue_player.index + 1)):
		dialogue_player.update()
		
		if !(dialogue_player.key_exists(dialogue_key_prefix + String(dialogue_player.index + 2))):
			button_done.show()
			button_next.hide()

		display(dialogue_key_prefix, dialogue_player.index)
		emit_signal("line_displayed", dialogue_key_prefix + String(dialogue_player.index))
		print("[DialogueBox.gd] line displayed signal emitted, index: ", dialogue_player.index)


func _on_Done_pressed():
	if battle_done:
		get_tree().change_scene_to_file("res://Main/Main.tscn")
	self.hide()




