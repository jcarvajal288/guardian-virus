extends Node2D

const MISSILE: PackedScene = preload("res://Actors/Missile/Missile.tscn")


func _ready() -> void:
	print(global_position)
	$LaunchTimer.timeout.connect(launch_missile)


func launch_missile() -> void:
	var missile = MISSILE.instantiate()

	var move_pattern = MovementPatterns.DOWNWARDS_TOWARDS_PLAYER.instantiate()
	move_pattern.subject = missile
	move_pattern.speed = 100.0
	move_pattern.horizontal_accel = 20.0

	missile.global_position = global_position
	missile.add_child(move_pattern)
	get_tree().root.add_child.call_deferred(missile)