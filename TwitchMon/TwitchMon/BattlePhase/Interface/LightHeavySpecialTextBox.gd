extends NinePatchRect

signal friendly_attack_queued(damage)

func _ready():
	pass


func _on_Special_pressed():
	emit_signal("friendly_attack_queued", 30)
	pass # Replace with function body.


func _on_Light_pressed():
	emit_signal("friendly_attack_queued", 10)
	pass # Replace with function body.


func _on_Heavy_pressed():
	emit_signal("friendly_attack_queued", 20)
	pass # Replace with function body.


func _on_Back_pressed():
	self.visible = false
	get_parent().get_node("AttackItemsRunSpirits").visible = true
	pass # Replace with function body.
