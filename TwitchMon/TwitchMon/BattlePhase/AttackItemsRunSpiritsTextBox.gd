extends NinePatchRect

onready var lightHeavySpecial = get_parent().get_node("LightHeavySpecial")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	lightHeavySpecial.visible = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Text_3_pressed():
	get_tree().change_scene("res://Main/Main.tscn")
	

func _on_Text_1_pressed():
	lightHeavySpecial.visible = true
	self.visible = false


