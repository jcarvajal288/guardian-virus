class_name Enemy extends CharacterBody2D

signal on_death

func _init() -> void:
	z_index = Global.RenderOrder.ENEMY


func take_damage(_dmg: int) -> void:
	on_death.emit()
	queue_free()
