extends Node

var dialogue: Dictionary
var index = 0

signal dialogue_loaded
signal placeholder_value_request (key)



func load_dialogue(file_path) -> Dictionary:
	var file = File.new()
	assert (file.file_exists(file_path))

	file.open(file_path, file.READ)
	dialogue = parse_json(file.get_as_text())
	assert (dialogue.size() > 0)

	return dialogue
	emit_signal("dialogue_loaded")


func update() -> void:
	index += 1


#reads the line with this key from the loaded dialogue json
func read_dialogue(key,index) -> String:
	var line = dialogue[String(key) + String(index)].format(get_parent().dialogue_placeholder_dict)
	return line


func key_exists(key):
	if dialogue.has(key):
		return true
	return false

