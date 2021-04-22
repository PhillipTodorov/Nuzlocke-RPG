extends Control

onready var health_bar_texture = $HealthBarTexture
onready var update_Tween = $HealthBarTexture/UpdateTween
onready var jobs = get_parent().get_node("Jobs")
onready var stats = get_parent().get_node("Jobs/Stats")
onready var hp = $HP
onready var label_handler = get_parent().get_node("LabelHandler")

func _ready():
	health_bar_texture.max_value = get_parent().get_node("Jobs/Stats").max_health
	print("[HealthBar.gd] max health:", get_parent().get_node("Jobs/Stats").max_health)
	health_bar_texture.value = get_parent().get_node("Jobs/Stats").health
	print("[HealthBar.gd] health:", get_parent().get_node("Jobs/Stats").health)
	jobs.connect("health_changed", self, "_on_health_updated")
	stats.connect("health_changed", self, "_on_health_updated")
	jobs.connect("max_health_changed", self, "_on_max_health_updated")



func _on_health_updated(amount):
	print("[healthbar.gd] health changed")
#	health_bar_texture.value = amount
	update_Tween.interpolate_property(health_bar_texture, "value", health_bar_texture.value, amount, 0.4, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	update_Tween.start()
	label_handler.update_hp_label(amount)
	

func _on_max_health_updated(max_health):
	health_bar_texture.max_value = max_health
