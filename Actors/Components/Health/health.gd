class_name Health extends Node

@export var max_health: float
@onready var current_health = max_health

signal health_changed(current_health: float, max_health: float)
signal on_death


func _on_hit(damage: float) -> void:
	current_health -= damage
	health_changed.emit(current_health, max_health)
	if current_health <= 0:
		on_death.emit()