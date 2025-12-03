extends NinePatchRect

@onready var attackItemsRun = get_parent().get_node("AttackItemsRunSpirits")
var damageQueued = 0

signal action_queued

# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false
	
	pass # Replace with function body.


#run
func _on_Text_3_pressed():
	attackItemsRun.visible = true
	self.visible = false


#light
func _on_Text_2_pressed():
	damage_done(10)
	pass # Replace with function body.


#heavy
func _on_Text_4_pressed():
	damage_done(20)
	pass # Replace with function body.


#special
func _on_Text_1_pressed():
	damage_done(30)
	pass # Replace with function body.


func damage_done(amount):
	damageQueued = amount
	emit_signal("action_queued")


