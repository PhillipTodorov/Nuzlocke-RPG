extends Node

var dialogue: Dictionary
var index = 0

signal dialogue_loaded
signal placeholder_value_request (key)



func load_dialogue(file_path: String) -> Dictionary:
# Check existence
	if not FileAccess.file_exists(file_path):
		push_error("Dialogue file not found: " + file_path)
		return {}

	# Open file
	var file := FileAccess.open(file_path, FileAccess.READ)
	var text := file.get_as_text()
	
		# Parse JSON
	var json: Dictionary = JSON.parse_string(text)

	if json == null:
		push_error("Failed to parse JSON in: " + file_path)
		return {}
	
	dialogue = json	
	assert (dialogue.size() > 0)
	
	emit_signal("dialogue_loaded")
	return dialogue
	


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
