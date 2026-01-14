extends Area2D

@export var target: Global.CollisionLayer = Global.CollisionLayer.PLAYER

func _ready() -> void:
	set_collision_mask_value(target, true)

