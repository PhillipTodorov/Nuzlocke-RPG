extends NinePatchRect


func _ready():
	pass


func _on_Attack_pressed():
	self.visible = false 
	get_parent().get_node("LightHeavySpecial").visible = true
	pass # Replace with function body.


func _on_Run_pressed():
	get_tree().change_scene("res://Main/Main.tscn")
	pass # Replace with function body.
