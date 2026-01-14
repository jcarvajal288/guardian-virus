extends Area2D

@export var target: Global.CollisionLayer = Global.CollisionLayer.SHOT

signal on_hit


func _ready() -> void:
	set_collision_mask_value(target, true)
	area_entered.connect(_on_area_entered)


func _on_area_entered(_area: Area2D) -> void:
	on_hit.emit()
