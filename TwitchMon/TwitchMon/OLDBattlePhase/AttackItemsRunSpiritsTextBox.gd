extends NinePatchRect

@onready var lightHeavySpecial = get_parent().get_node("LightHeavySpecial")


# Called when the node enters the scene tree for the first time.
func _ready():
	lightHeavySpecial.visible = true
	pass # Replace with function body.



func _on_Text_3_pressed():
	get_tree().change_scene_to_file("res://Main/Main.tscn")
	

func _on_Text_1_pressed():
	lightHeavySpecial.visible = true
	self.visible = false


