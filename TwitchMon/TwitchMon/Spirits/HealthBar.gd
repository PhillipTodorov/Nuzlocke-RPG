extends Control

onready var update_Tween = $"HealthBar/UpdateTween"
onready var health_bar = $HealthBar
onready var value = 0

func _ready():
	print("healthbar.gd, before", value)
	self.value = get_parent().health
	print("after", value)
	pass


func _on_health_updated(amount):
	update_Tween.interpolate_property(health_bar, "value", health_bar.value, amount, 0.4, Tween.TRANS_SINE, Tween.EASE_OUT)
	update_Tween.start()

func _process(delta):
	if Input.is_action_just_pressed("increase_health"):
		_on_health_updated(health_bar.value + 20)
