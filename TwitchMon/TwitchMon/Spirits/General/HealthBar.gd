extends Control

onready var health_bar_texture = $HealthBarTexture
onready var update_Tween = $UpdateTween
onready var jobs = get_parent().get_node("Jobs")
onready var stats = get_parent().get_node("Jobs/Stats")

func _ready():
	health_bar_texture.value = get_parent().get_node("Jobs/Stats").health
	jobs.connect("health_changed", self, "_on_health_updated")
	stats.connect("health_changed", self, "_on_health_updated")
	pass


func _on_health_updated(amount):
	print("[healthbar.gd] health changed")
	health_bar_texture.value = amount
	#update_Tween.interpolate_property(self, "value", self.value, amount, 0.4, Tween.TRANS_SINE, Tween.EASE_OUT)
	#update_Tween.start()

func _process(delta):
	if Input.is_action_just_pressed("increase_health"):
		_on_health_updated(health_bar_texture.value + 20)
		print("[healthbar.gd] health increased")
