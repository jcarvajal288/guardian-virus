extends Node2D

const HEALTH_PIP: PackedScene = preload("res://UI/StatusBar/HealthBar/HealthPip.tscn")

const HEALTH_PIP_FULL = 0
const HEALTH_PIP_75 = 1
const HEALTH_PIP_50 = 2
const HEALTH_PIP_25 = 3
const HEALTH_PIP_EMPTY = 4

const PIP_WIDTH = 5

var starting_health = 5.0

func _ready() -> void:
	draw_health(starting_health, starting_health)


func draw_health(current_health: float, max_health: float) -> void:
	var full_pips = floor(current_health)
	var fractional_pip = fmod(current_health, 1.0)
	var empty_pips = floor(max_health - full_pips - fractional_pip)

	for i in full_pips:
		var pip = HEALTH_PIP.instantiate()	
		add_child(pip)
		pip.frame = HEALTH_PIP_FULL
		pip.position = Vector2(i * PIP_WIDTH, 0)

	if fractional_pip > 0.0:
		var pip = HEALTH_PIP.instantiate()	
		add_child(pip)
		if fractional_pip <= 0.33:
			pip.frame = HEALTH_PIP_25
		elif fractional_pip <= 0.66:
			pip.frame = HEALTH_PIP_50
		else:
			pip.frame = HEALTH_PIP_75
		pip.position = Vector2((full_pips) * PIP_WIDTH, 0)
	
	for i in empty_pips:
		var pip = HEALTH_PIP.instantiate()	
		add_child(pip)
		pip.frame = HEALTH_PIP_EMPTY
		var x_position = (full_pips + i)
		if fractional_pip > 0.0:
			x_position += 1
		pip.position = Vector2(x_position * PIP_WIDTH, 0)

