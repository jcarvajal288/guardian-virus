extends Node2D

const SPAWN_TOP_LEFT = Vector2(10.0, -20)
const SPAWN_TOP_MIDDLE = Vector2(80, -20)
const SPAWN_TOP_RIGHT = Vector2(150.0, -20)

const MISSILE: PackedScene = preload("res://Actors/Missile/Missile.tscn")

func _ready() -> void:
	$SpawnTimer.timeout.connect(spawn_missile)


func spawn_missile() -> void:
	var spawns = [SPAWN_TOP_LEFT, SPAWN_TOP_MIDDLE, SPAWN_TOP_RIGHT]
	var spawn = Global.rng.randi_range(0, spawns.size() - 1)
	var missile = MISSILE.instantiate()
	missile.global_position = spawns[spawn]
	get_parent().add_child.call_deferred(missile)
