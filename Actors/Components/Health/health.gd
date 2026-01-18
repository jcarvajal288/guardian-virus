class_name Health extends Node

@export var max_health: float
@onready var current_health = max_health

signal on_death


func _on_hit(damage: float) -> void:
	current_health -= damage
	if current_health <= 0:
		on_death.emit()