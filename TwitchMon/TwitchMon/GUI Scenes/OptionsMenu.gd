extends Control


signal CloseOptions


func _on_OptionsExit_pressed():
	emit_signal("CloseOptions")
