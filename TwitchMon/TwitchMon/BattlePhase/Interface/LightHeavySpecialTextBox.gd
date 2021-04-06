extends NinePatchRect

signal friendly_attack_queued(attack, damage)

func _ready():
	pass


func _on_Special_pressed():
	print("[LightHeavySpecialTextBox.gd] special attack")
	emit_signal("friendly_attack_queued", "Special", 30)
	pass # Replace with function body.


func _on_Light_pressed():
	emit_signal("friendly_attack_queued", "Light", 10)
	pass # Replace with function body.


func _on_Heavy_pressed():
	emit_signal("friendly_attack_queued", "Heavy", 20)
	pass # Replace with function body.


func _on_Back_pressed():
	self.visible = false
	get_parent().get_node("AttackItemsRunSpirits").visible = true
	pass # Replace with function body.
