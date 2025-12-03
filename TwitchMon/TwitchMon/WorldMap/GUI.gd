extends CanvasLayer


func _input(event):
	if event.is_action_pressed("GameMenu"):
		get_node("GameMenu").show()

func _on_OptionBtn_pressed():
	var options_menu = load("res://GUI Scenes/OptionsMenu.tscn").instantiate()
	add_child(options_menu)
	get_node("OptionsMenu").connect("CloseOptions", Callable(self, "CloseOptions"))


func CloseOptions():
	get_node("OptionsMenu").queue_free()

func _on_ExitBtn_pressed():
	get_node("GameMenu").hide()
