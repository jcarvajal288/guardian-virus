class_name Hurtbox extends Area2D

signal on_hit(dmg: int)

func register_hit(dmg: int) -> void:
	on_hit.emit(dmg)